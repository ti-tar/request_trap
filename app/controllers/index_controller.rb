class IndexController < ApplicationController

  def index
    @entries = Entry.order(created_at: :desc).all
  end

  def url_catcher
    e = Entry.new
    e.trap_id = params[:trap_id]
    e.ip = request.headers['REMOTE_ADDR']
    e.method = request.headers['REQUEST_METHOD']
    e.cookies = request.headers['HTTP_COOKIE']
    e.uri = params[:requested_url]
    e.save

    ActionCable.server.broadcast('entries', js: e.as_json, html: _render_row(e))
    @entry = e
  end

  # показываем все записи по :trap_id
  def show_group
    @trap_id = params[:trap_id]
    @entries = Entry.where(trap_id: @trap_id).order(created_at: :desc).all
  end

  # показваем одну запись по :id
  def show_single
    @trap_id = params[:trap_id]
    @entry = Entry.find(params[:id])
  end

  private

  def _render_row(e)
    ApplicationController.render(partial: "index/tr", locals: {entry: e})
  end

end