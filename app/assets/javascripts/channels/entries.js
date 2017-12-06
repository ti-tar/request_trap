function runWebSocket() {

    App.entries = App.cable.subscriptions.create(
        {
            channel: "EntriesChannel"
        },
        {
            received: function (data) {
                this.insertTag(data);
            },
            insertTag: function (data) {
                console.log(data.js);
                var parent = document.querySelector('table.entries-list tbody');
                var newTag = document.createElement('tr');
                newTag.innerHTML = data.html;
                parent.insertBefore(newTag, parent.firstElementChild);
            }
        }
    );

}