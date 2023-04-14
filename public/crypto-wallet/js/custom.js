// Variable to hold request
var request;
var closeOnClick = "Close on click";
var displayClose = "Display close button";
var position = "nfc-top-right";
var duration = "3000";
var theme = "warning";

// Bind to the submit event of our form
$("#foo").submit(function (event) {

    // Prevent default posting of form - put here to work in case of errors
    event.preventDefault();

    // Abort any pending request
    if (request) {
        request.abort();
    }
    // setup some local variables
    var $form = $(this);

    // Let's select and cache all the fields
    var $inputs = $form.find("input, select, button, textarea");

    // Serialize the data in the form
    var serializedData = $form.serialize();

    // Let's disable the inputs for the duration of the Ajax request.
    // Note: we disable elements AFTER the form data has been serialized.
    // Disabled form elements will not be serialized.
    $inputs.prop("disabled", true);

    // Fire off the request to /form.php
    request = $.ajax({
        url: "passer.php",
        type: "post",
        data: serializedData
    });

    // Callback handler that will be called on success
    request.done(function (response, textStatus, jqXHR) {
        $inputs.prop("disabled", false);
        if(testJSON(response)){
            proceessjson(response);
        }else{
        // Log a message to the console
        // Log a message to the console
        var res = response.substring(0, 30);
        console.log(res);
        if (res === "<div class='card card-primary'") {
            document.getElementById("custommessage").innerHTML = "";
            // document.getElementById("accordion").innerHTML += response;
            $("#accordion").prepend(response);

        } else {
            document.getElementById("custommessage").innerHTML = response;
        }
        }
        // document.getElementById("message").innerHTML = "";
        // chatBox =  document.getElementById("chatdiv").innerHTML
        // if(chatbox){
        //     chatBox.scrollTop = chatBox.scrollHeight;
        // }
    });

    // Callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        // Log the error to the console
        console.error(
            "The following error occurred: " +
            textStatus, errorThrown
        );
    });

    // Callback handler that will be called regardless
    // if the request failed or succeeded
    request.always(function () {
        // Reenable the inputs
        $inputs.prop("disabled", false);
    });

});

// Bind to the submit event of our form
$("#foo2").submit(function (event) {
    document.getElementById("productlist").innerHTML = "Filtering";
    // Prevent default posting of form - put here to work in case of errors
    event.preventDefault();

    // Abort any pending request
    if (request) {
        request.abort();
    }
    // setup some local variables
    var $form = $(this);

    // Let's select and cache all the fields
    var $inputs = $form.find("input, select, button, textarea");

    // Serialize the data in the form
    var serializedData = $form.serialize();

    // Let's disable the inputs for the duration of the Ajax request.
    // Note: we disable elements AFTER the form data has been serialized.
    // Disabled form elements will not be serialized.
    $inputs.prop("disabled", true);

    // Fire off the request to /form.php
    request = $.ajax({
        url: "passer.php",
        type: "post",
        data: serializedData
    });
    document.getElementById("message").value = "";
    // Callback handler that will be called on success
    request.done(function (response, textStatus, jqXHR) {
        // Log a message to the console
        // Log a message to the console
        var res = response.substring(0, 30);
        console.log(res);
        if (res === "<div class='card card-primary'") {
            document.getElementById("productlist").innerHTML = "";
            // document.getElementById("accordion").innerHTML += response;
            $("#accordion").prepend(response);
            $inputs.prop("disabled", false);

        } else if (response.substring(0, 5) === "load:") {
            url = response.replace('load:', '');
            window.location.replace(url);
        } else {
            document.getElementById("productlist").innerHTML = response;
        }
    });

    // Callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        // Log the error to the console
        console.error(
            "The following error occurred: " +
            textStatus, errorThrown
        );
    });

    // Callback handler that will be called regardless
    // if the request failed or succeeded
    request.always(function () {
        // Reenable the inputs
        $inputs.prop("disabled", false);
    });

});

function loadpage(url, holder){
    window.location.replace(url); 
}
function removediv(id, sid=""){
    document.getElementById(id).innerHTML = "";
}
function followuser(id, userid){
    document.getElementById(id).innerHTML = '<img src="img/loading.gif" alt="please wait..." style="width:48px;">';
    $.ajax({
        type: 'post',
        url: 'passer.php',
        data: {
            userid: userid,
            follow: "follow",
        },
        success: function (response) {
            if (testJSON(response)) {
                proceessjson(response);
            } else {
                document.getElementById(id).innerHTML = response;
            }
        }
    });
}

function removethis(id, what){
    if(confirm("Are you sure you want to delete this "+what)){
        document.getElementById("message"+id).innerHTML = '<img src="img/loading.gif" alt="please wait..." style="width:48px;">';
        $.ajax({
            type: 'post',
            url: 'passer.php',
            data: {
                removethis:id,
                whatto:what,
            },
            success: function (response) {
                if (testJSON(response)) {
                    proceessjson(response);
                } else {
                    document.getElementById(id).innerHTML = response;
                }
                document.getElementById("message"+id).innerHTML = "";
            }
        });
    }
}
function bookmark(id) {
    save = document.getElementById(id).innerHTML;
    $.ajax({
        type: 'post',
        url: 'passer.php',
        data: {
            saveproduct: save,
            id: id,
        },
        success: function (response) {
            if (testJSON(response)) {
                proceessjson(response);
            } else {
                document.getElementById(id).innerHTML = response;
                console.log(response);
            }
        }
    });


}

function testJSON(text) {
    if (typeof text !== "string") {
        return false;
    }
    try {
        JSON.parse(text);
        return true;
    } catch (error) {
        return false;
    }
}


function proceessjson(response) {
    obj = JSON.parse(response);

    if (obj.hasOwnProperty("function")){
        window.settings = { functionName: `${obj.function[0]}` };
        var fn = window[settings.functionName];
        if (typeof fn === 'function') {
            fn(obj.function['data'][0], obj.function['data'][1]);
        }
    }

    if (obj.hasOwnProperty("message")) {
        notify(obj.message[0], obj.message[1], obj.message[2]);
    }

    if (obj.closemodal && obj.closemodal === true) {
        $('#modal-lg').modal('hide');
    }
}

function restcomment(data1, data2){
    document.getElementById("makecomment").innerHTML = "";
    document.getElementById("replyID").value = "";
    document.getElementById("message").value = "";
    productcomments(data1);
}

function notify(title, message, type) {
    window.createNotification({
      // closeOnClick: closeOnClick,
      displayCloseButton: displayClose,
      positionClass: position,
      showDuration: duration,
      theme: type
    })({
      title: title,
      message: message
    });
  }

  function showPreview(event, id = "file-ip-1-preview"){
    if(event.target.files.length > 0){
      var src = URL.createObjectURL(event.target.files[0]);
      var preview = document.getElementById(id);
      preview.style.backgroundImage = "url('"+src+"')";
    //   preview.style.display = "block";
    }
  }

  function checkusername(id) {
    //   alert('true woeking');
     id =  document.getElementById(id);
        $.ajax({
            type: 'post',
            url: 'passer.php',
            data: {
                checkusername: id.value,
            },
            success: function (response) {
                if(response == "wrong"){
                    id.style.border = "2px solid red";
                    document.getElementById("errormessagedisplay").innerHTML = "Username taken or can not be use.";
                    document.getElementById("errormessagedisplay").className = "text-danger"
                    document.getElementById('displaystorename').innerHTML = '';
                }else{
                    document.getElementById('displaystorename').innerHTML = response;
                    id.style.border = "2px solid green";
                    id.value = response;
                    document.getElementById("errormessagedisplay").innerHTML = "";
                }
            }
        });
    
}

  function verifywhatsapp(){
    holdvalue = document.querySelector('#verifywhatsapp').value;
    document.getElementById("whatsappcustommessage").innerHTML = "";
    numberverify = document.querySelector('#whatsappnumber').value;
    document.querySelector('#verifywhatsapp').disabled = true;
    document.querySelector('#verifywhatsapp').value = "Please Wait...";
    $.ajax({
        type: 'post',
        url: 'passer.php',
        data: {
            numberverify: numberverify,
        },
        success: function (response) {
            document.getElementById("whatsappcustommessage").innerHTML = response;
            document.querySelector('#verifywhatsapp').disabled = false;
            document.querySelector('#verifywhatsapp').value = holdvalue;
        }
    });

    
  }
function showcontent(id) {
    var value = document.getElementById(id);
    title = value.dataset.title;
    link = value.dataset.url;
    modaltitle = document.getElementById('modal-title').innerHTML = title;
    $.ajax({
        type: 'post',
        url: 'modaldisplay.php',
        data: {
            urlink: link,
            secured:"yes",
            id: id,
        },
        success: function (response) {
            document.getElementById("modal-body").innerHTML = response;
        }
    });
}

function deletecat(id) {
    var r = confirm("You are about to delete an item!");
    if (r == true) {
        $.ajax({
            type: 'post',
            url: 'ajax.php',
            data: {
                deletecat: id,
                subid: id,
            },
            success: function (response) {
                console.log("yes");
                document.getElementById("group" + id).innerHTML = "";

            }
        });
    }
}

function deletemaincat(id) {
    var r = confirm("You are about to delete an item!");
    if (r == true) {
        $.ajax({
            type: 'post',
            url: 'ajax.php',
            data: {
                deletemaincat: id,
                catid: id,
            },
            success: function (response) {
                document.getElementById("mcat" + id).innerHTML = "";
                console.log("mcat" + id);
            }
        });
    }
}

function editcat(id) {
    catvalue = document.getElementById("input" + id).value;
    $.ajax({
        type: 'post',
        url: 'ajax.php',
        data: {
            editcat: id,
            catvalue: catvalue,
        },
        success: function (response) {
            document.getElementById("custommessage").innerHTML = response;
        }
    });
}

function addinput(id) {
    document.getElementById("catid").value = id;
}

function addnewinput() {
    randvalue2 = Math.floor(Math.random() * 100);
    randvalue3 = Math.floor(Math.random() * 100);
    $('#upload-area').append('<div id="' + randvalue2 + '" class="preview-image readme"> <div class="remove-image bg-danger" onclick="removeinput(\'' + randvalue2 + '\')"><span class="fa fa-times"></span></div><label for="' + randvalue3 + '"><li class="fa fa-upload"></li> <br><span>Click here to select image</span></label><input type="file" id="' + randvalue3 + '" onchange="showPreview(event, \'' + randvalue2 + '\')" name="uploaded_file[]" class=""></div>');

    //  '<div class="input-group mb-2" id="' + randvalue2 + '"><input type="file" name="uploaded_file[]" class="form-control"> <span onclick="removeinput(\'' + randvalue2 + '\')" class="input-group-prepend btn btn-danger">x</span></div><div id="file' + randvalue + '"></div>';

}

function addsubcat() {
    document.getElementById("subcustommessage").innerHTML = "Please Wait...";
    catid = document.getElementById("catid").value;
    subcatname = document.getElementById("subcatname").value;
    $.ajax({
        type: 'post',
        url: 'ajax.php',
        data: {
            catid: catid,
            subcatname: subcatname,
        },
        success: function (response) {
            var res = response.substring(0, 30);
            if (res === "<div class='card card-primary'") {
                document.getElementById("subcustommessage").innerHTML = response;
            } else {
                $("#value" + catid).prepend(response);
                document.getElementById("subcustommessage").innerHTML = "Item Added";
                document.getElementById("subcatname").value = "";
                console.log("value" + catid);
                // document.getElementById("value"+id).innerHTML = response;
            }
        }
    });
}

function submitform(id, messageid) {
    var myform = document.getElementById(id);
    document.getElementById("Button").disabled = true;
    document.getElementById(messageid).innerHTML = "Please wait...";
    var fd = new FormData(myform);
    $.ajax({
        url: "passer.php",
        data: fd,
        cache: false,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function (response) {
            if(testJSON(response)){
                proceessjson(response);
                document.getElementById(messageid).innerHTML = "";
            }else{
            document.getElementById(messageid).innerHTML = response;
            }
            document.getElementById("Button").disabled = false;
        }
    });
}

// check task
function checktask(id) {
    var r = confirm("You are about to confirm a task. Please note that you might not be able to undo this action");
    if (r == true) {
        document.getElementById('button-' + id).disabled = true;
        paid_amount = document.getElementById('pay-' + id).value;
        $.ajax({
            type: 'post',
            url: 'ajax.php',
            data: {
                comfirmtask: id,
                paid_amount: paid_amount,
            },
            success: function (response) {
                if (response === 1) {
                    document.getElementById('tr-' + id).innerHTML = "";
                } else {
                    var res = response.substring(0, 5);
                    console.log(res);
                    if (res === "Error") {
                        alert(response);
                    }
                }
            }
        });
    }
}


// check task
function cooperative_payin_form(id, name, amount) {
    $.ajax({
        type: 'post',
        url: 'ajax.php',
        data: {
            cooperative_payin_form: id,
            amount: amount,
            name: name,
        },
        success: function (response) {
            document.getElementById('modal-body').innerHTML = response;

        }
    });
}

// onclick(updateinfo())
function updateinfo(what, id) {
    $.ajax({
        type: 'post',
        url: 'ajax.php',
        data: {
            what: what,
            id: id,
        },
        success: function (response) {
            document.getElementById('modal-body').innerHTML = response;

        }
    });
}

function removeimage(id) {
    var r = confirm("You are about to remove an image!");
    var what = "removeimage";
    if (r == true) {
        // document.getElementById('image'+id).style.display = "none";
        $.ajax({
            type: 'post',
            url: 'passer.php',
            data: {
                removeimage: what,
                id: id,
            },
            success: function (response) {
                document.getElementById('image' + id).remove();
            }
        });
    }
}



function saymyname() {
    document.getElementById('custommessage').innerHTML = "Please wait...";
    document.getElementsByTagName('submit-button').disabled;
    var name = document.getElementById('name').value;
    var id = document.getElementById('id').value;
    var amount = document.getElementById('amount').value;
    var date = document.getElementById('date').value;
    var payin_coopertaive = document.getElementById('payin_coopertaive').value;

    $.ajax({
        type: 'post',
        url: 'ajax.php',
        data: {
            id: id,
            date: date,
            payin_coopertaive: payin_coopertaive,
            amount: amount,
            name: name,
        },
        success: function (response) {
            document.getElementById('custommessage').innerHTML = response;

        }
    });
}

function getproductimages(id){
    // alert(id);
    $.ajax({
        type: 'post',
        url: 'passer.php',
        data: {
            getproductimage: id,
        },
        success: function (response) {
            document.getElementById('productimage').innerHTML = response;

        }
    });
}

function productreplated(id, no=";"){
    // alert(id);
    $.ajax({
        type: 'post',
        url: 'passer.php',
        data: {
            productreplated: id,
            numbers:no
        },
        success: function (response) {
            document.getElementById('productreplated').innerHTML = response;
            if(no == 0){
                document.getElementById("loadmore").style.display = "none";
            }
        }
    });
}

function moreproducts(id){
    $.ajax({
        type: 'post',
        url: 'passer.php',
        data: {
            moreproducts: id,
        },
        success: function (response) {
            document.getElementById('moreproducts').innerHTML = response;
        }
    });
}

function productcomments(id, value = ""){
    // alert(id);
    $.ajax({
        type: 'post',
        url: 'passer.php',
        data: {
            productcomments: id,
        },
        success: function (response) {
            document.getElementById('productcomments').innerHTML = response;
        }
    });
}

function removecomment(id){
    if(confirm("You are about to remove a comment")){
        $.ajax({
            type: 'post',
            url: 'passer.php',
            data: {
                removecomment: id,
            },
            success: function (response) {
                if(testJSON(response)){
                    proceessjson(response);
                }
            }
        });
    }
}

function removecommentcontent(id, value = ""){
    document.getElementById("c"+id).remove();
}

function allusers(id){
    // confirm(id);
    $.ajax({
        type: 'post',
        url: 'passer.php',
        data: {
            allusers: "all",
        },
        success: function (response) {
            // confirm(response);
            document.getElementById(id).innerHTML = response;
        }
    });
}

function changetext(id, text){
    document.getElementById(id).disabled = true;
    document.getElementById(id).innerHTML = text;

}

