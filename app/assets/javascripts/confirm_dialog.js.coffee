
$.rails.allowAction = (link) ->
     return true unless link.attr('data-confirm')
     $.rails.showConfirmDialog(link)
     false
$.rails.confirmed = (link) ->
     link.removeAttr('data-confirm')
     link.trigger('click.rails')
$.rails.showConfirmDialog = (link) ->
     message = link.attr('data-confirm')
     html = """
            <div class="modal" id="confirmationDialog"  >
              <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>

              </div>
              <div class="modal-body" >
                <h3> <font color="white">Are you sure want to delete? </font > </h3>
              </div>
              <div class="modal-footer">
                <a data-dismiss="modal" class="btn btn-primary">Cancel</a>
                <a data-dismiss="modal" class="btn btn-primary confirm">OK</a>
              </div>
            </div>
            """
     $(html).modal()
     $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)
  

