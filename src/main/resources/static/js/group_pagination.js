/**
 * pagination used in imgroup/group only now.
 */

$(function () {
    /*function putSearchKey(){
        var keyword = $('#search_form').find('input[name=search_key]').val().trim();
        $('#search_form').find('input[name=search_key]').val('');
        SB.sendSearchEmailCookie(keyword);
    }*/

   /* go_to_page = "#inputPagination";
    $(go_to_page).off("keypress").on("keypress", function(event) {
        if(event.which === 13) {
            var page = parseInt($(go_to_page).val());

            if(!isNaN(page) && page > 0) {

                if(page > $('#totalPage').val()) {group_pagination.js
                    page = $('#totalPage').val();
                }
                //putSearchKey();
                $(go_to_page).val(page);
                window.location.href = SB.replaceUrl(/p=\d+/ig, 'p=' + page);
            }
            event.preventDefault(); // MSIE strange behaviour
        } else {
            if(!(event.which === 8 || event.which === 0 || (event.shiftKey === false && (event.which > 47 && event.which < 58)))) {
                event.preventDefault();
            }
        }
    });*/

    $('#aaa').on('click',function () {
        alert(1);
    })

    /*$('.mypagination').on('a', 'click', function(){
        debugger;

        var li = $(this).parent();
        if (li.hasClass('disabled') || li.hasClass('active')) {
            return false;
        }
        var page = parseInt($(this).attr('p'), 10);
        //putSearchKey();
        window.location.href = SB.replaceUrl(/p=\d+/ig, 'p=' + page);
        return false;
    });*/

});