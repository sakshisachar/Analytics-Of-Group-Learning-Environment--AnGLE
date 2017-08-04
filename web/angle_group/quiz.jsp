<%@page import="angle_group.AngleUtility"%>
<%@page import="java.util.Date"%>
<div class="tab-pane" id="Create_Quiz">
                                                <div class="row">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="x_panel">
                                                            <div class="x_title">
                                                                <h2>Create Quiz</h2>
                                                                <input type="hidden" id="quiz_id">
                                                                <input type="hidden" id="groupId" value="<s:property value="gid"/>" >
                                                                <input type="hidden" id="userId" value="<s:property value="#session.loggedInUser.loginId"/>" >
                                                                <ul class="nav navbar-right panel_toolbox">
                                                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                                                </ul>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                            <div class="x_content">
                                                                <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="qtitle">Title <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                            <input type="text" id="qtitle" name="qtitle" required="required" class="form-control col-md-7 col-xs-12" value="">
                                                                        </div>
                                                                        <div id="qTitleError" class="errorMsgalert" style="display: none;">
                                                                            Please put something here
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datepicker1">Date <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                            <input type="text" class="form-control has-feedback-left" id="datepicker1" name="date" placeholder="Date " aria-describedby="inputSuccess2Status">
                                                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                                            <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                                                        </div>
                                                                        <div id="dateError" class="errorMsgalert" style="display: none;">
                                                                            Please select date
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="timepicker1">Time <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12" >
                                                                            <input type='text' class="form-control col-md-7 col-xs-12" id="timepicker1" required="required" />
                                                                        </div>
                                                                        <div id="timeError" class="errorMsgalert" style="display: none;">
                                                                            Please select time of quiz
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="duration">Quiz Duration <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12" >
                                                                            <input type='number' id="duration"> minutes
                                                                        </div>
                                                                        <div id="durationError" class="errorMsgalert" style="display: none;">
                                                                            Please select duration of quiz
                                                                        </div>
                                                                    </div>

                                                                    <button id="qnext" class="btn btn-success" onclick="saveQuiz();">Next</button>
                                                                    <p id="qinformationError" style="display: none; color: red;">Please Fill Quiz Information</p>
                                                                </div>
                                                            </div>
                                                        </div>        
                                                    </div>    
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div id="QuestionsContent" style="display: none;">
                                                        </div>
                                                        <div class="x_panel" id="AddQuestions" style="display: none;">
                                                            <div  class="x_content" >
                                                                To Add New Question <input class="btn btn-warning" style="" type="button" value="ADD" onclick="createQuestions();"/>
                                                            </div> 
                                                             <div  class="x_content" >
                                                                Are You Done ? <input class="btn btn-warning" style="" type="button" value="DONE" onclick="submitQuiz();"/>
                                                            </div> 
                                                        </div>
                                                    </div>
                                                </div>

                                                <script>
                                                    function saveQuiz() {
                                                        var val = 0;
                                                        var qtitle = document.getElementById("qtitle").value;
                                                        var groupId = document.getElementById("groupId").value;
                                                        var userId = document.getElementById("userId").value;
                                                        var duration = document.getElementById("duration").value;
                                                        document.getElementById("qtitle").style.border = "";
                                                        document.getElementById("datepicker1").style.border = "";
                                                        document.getElementById("timepicker1").style.border = "";
                                                        document.getElementById("duration").style.border = "";
                                                        // hide error label
                                                        document.getElementById("qTitleError").style.display = "none";
                                                        document.getElementById("dateError").style.display = "none";
                                                        document.getElementById("timeError").style.display = "none";
                                                        document.getElementById("durationError").style.display = "none";

                                                        var d = document.getElementById("datepicker1").value + " " + document.getElementById("timepicker1").value;
                                                        var d1 = new Date(d);
                                                        var todayDate = new Date();

                                                        if (d.trim().length > 0 && todayDate < d1) {
                                                            document.getElementById("qinformationError").style.display = "none";
                                                        } else {
                                                            document.getElementById("datepicker1").style.border = "1px solid #CE5454";
                                                            document.getElementById("dateError").innerHTML = "Please enter a valid date of quiz";
                                                            document.getElementById("dateError").style.display = "inline";
                                                        }

                                                        if (qtitle.trim().length === 0 ) {
                                                            document.getElementById("qtitle").style.border = "1px solid #CE5454";
                                                            document.getElementById("qTitleError").style.display = "inline";
                                                        }
                                                        if (duration <= 0 ) {
                                                            document.getElementById("duration").style.border = "1px solid #CE5454";
                                                            document.getElementById("durationError").style.display = "inline";
                                                        }
                                                        if (qtitle.trim().length > 0 && (todayDate <= d1) && val === 0) {
                                                            document.getElementById("qinformationError").style.display = "none";
                                                            saveQuizData(userId, groupId, qtitle, d, duration);
                                                        } else {
                                                            //document.getElementById("sinformationError").style.display = "inline";
                                                        }

                                                    }

                                                    function saveQuizData(userId, groupId, title, dateStr, duration) {
                                                        var data = "userId=" + userId + "&groupId=" + groupId + "&title=" + title + "&date=" + dateStr + "&duration=" + duration;
                                                        $.ajax({
                                                            url: "angle_group/DAO_saveQuizData.jsp",
                                                            type: "GET",
                                                            data: data,
                                                            dataType: "json",
                                                            success: set_saveQuizData,
                                                            error: onError
                                                        });
                                                    }

                                                    function set_saveQuizData(data) {
                                                        var res = data.split("#");
                                                        if (parseInt(res[0]) === 1) {
                                                            //document.getElementById("qhiddenId_"+parseInt(res[0])).value=parseInt(res[1]);
                                                            document.getElementById("QuestionsContent").style.display = 'inline';
                                                            document.getElementById("AddQuestions").style.display = 'inline-block';
                                                            document.getElementById("quiz_id").value = parseInt(res[1]);
                                                            document.getElementById("qnext").style.display = "none";
                                                        } else {
                                                            $.alert({
                                                                title: 'Error',
                                                                content: ''
                                                            });
                                                        }
                                                    }

                                                    function onError() {
                                                        $.alert({
                                                            title: 'Error',
                                                            content: ''
                                                        });
                                                    }

                                                    function createQuestions() {
                                                        document.getElementById("QuestionsContent").style.display = "inline";
                                                        var arr = document.getElementsByClassName("quiz_question_form_box");
                                                        var lastid = arr.length;
                                                        if (lastid === 0) {
                                                            lastid = 1;
                                                        } else {
                                                            var ques_div_id = document.getElementsByClassName('quiz_question_form_box')[lastid - 1].id;
                                                            var quesid_part = ques_div_id.split("_");
                                                            var lastqId = parseInt(quesid_part[1])
                                                            lastid = (lastqId + 1);
                                                        }
                                                        var xPanelHtml = '';
                                                        var x_title_div = document.createElement('div');
                                                        x_title_div.className = 'x_title';
                                                        x_title_div.innerHTML = "Question " + lastid;

                                                        var x_title_ul = document.createElement("ul");
                                                        x_title_ul.className = 'nav navbar-right panel_toolbox';

                                                        var x_title_li = document.createElement("li");

                                                        var x_title_a = document.createElement("a");
                                                        $(x_title_a).addClass('collapse-link');

                                                        var x_title_i = document.createElement("i");
                                                        x_title_i.className = 'fa fa-chevron-up';

                                                        x_title_a.appendChild(x_title_i);
                                                        x_title_li.appendChild(x_title_a);
                                                        x_title_ul.appendChild(x_title_li);
                                                        x_title_div.appendChild(x_title_ul);

                                                        var clearfix_div = document.createElement('div');
                                                        clearfix_div.className = 'clearfix';
                                                        x_title_div.appendChild(clearfix_div);

                                                        var x_content_div = document.createElement('div');
                                                        x_content_div.className = 'x_content';

                                                        var x_content_row1 = document.createElement('div');
                                                        x_content_row1.className = 'row';
                                                        var x_content_row2 = document.createElement('div');
                                                        x_content_row2.className = 'row';
                                                        /*row1 column*/
                                                        var x_content_row1_left = document.createElement('div');
                                                        var x_content_row1_right = document.createElement('div');
                                                        var x_content_row2_left = document.createElement('div');
                                                        var x_content_row2_right = document.createElement('div');
                                                        x_content_row1_left.className = "col-md-9 col-sm-12 col-xs-12 form-group";
                                                        x_content_row1_right.className = "col-md-3 col-sm-12 col-xs-12 form-group";
                                                        x_content_row2_left.className = "col-md-9 col-sm-12 col-xs-12 form-group";
                                                        x_content_row2_right.className = "col-md-3 col-sm-12 col-xs-12 form-group";

                                                        x_content_row1.appendChild(x_content_row1_left);
                                                        x_content_row1.appendChild(x_content_row1_right);
                                                        x_content_row2.appendChild(x_content_row2_left);
                                                        x_content_row2.appendChild(x_content_row2_right);

                                                        var x_row1_right_element3 = document.createElement('div');
                                                        x_row1_right_element3.className = "form-group";
                                                        var x_row1_left_element1 = document.createElement('div');
                                                        x_row1_left_element1.className = "form-group";
                                                        var x_row1_left_element2 = document.createElement('div');
                                                        x_row1_left_element2.className = "form-group";

                                                        var iDiv = document.createElement('div');
                                                        iDiv.id = 'question_' + lastid;
                                                        iDiv.className = 'x_panel quiz_question_form_box';
                                                        iDiv.name = "questions";
                                                        iDiv.innerHTML = "";

                                                        document.getElementById("QuestionsContent").appendChild(iDiv);

                                                        var innerDiv = document.createElement('div');
                                                        innerDiv.id = 'question_typeBlock_' + lastid;
                                                        innerDiv.className = 'question_typeBlock';

                                                        var input = document.createElement("textarea");
                                                        input.id = "question_textarea_" + lastid;
                                                        input.rows = "3";
                                                        input.className = "form-control";
                                                        input.placeholder = "Question";
                                                        document.getElementById("QuestionsContent").appendChild(innerDiv);


//                                                        Options
                                                        document.getElementById('question_typeBlock_' + lastid).innerHTML = "";

                                                        var optionContainerMain = document.createElement('div');
                                                        optionContainerMain.id = 'optionContainerMain_' + lastid;
                                                        optionContainerMain.className = 'optionContainerMain';

                                                        var optionContainer = document.createElement('div');
                                                        optionContainer.id = 'optionContainer_' + lastid + '_1';
                                                        optionContainer.className = 'form-group optionContainer_' + lastid;

                                                        var option_row = document.createElement('div');
                                                        option_row.className = "row";

                                                        var option_row_left = document.createElement('div');
                                                        var option_row_middle = document.createElement('div');
                                                        var option_row_right = document.createElement('div');
                                                        option_row_left.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";
                                                        option_row_middle.className = "col-md-10 col-sm-8 col-xs-8 fluid form-group text-left";
                                                        option_row_right.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";

                                                        var div_radio = document.createElement('div');
                                                        div_radio.className = "radio";

                                                        var radio_label = document.createElement('label');

                                                        var radioInput = document.createElement('input');
                                                        radioInput.setAttribute('type', 'radio');
                                                        radioInput.id = 'questionOption_' + lastid + '_1';
//                                                        radioInput.disabled = true;
                                                        radioInput.className = "flat";
                                                        radioInput.name = 'questionOption_' + lastid;
                                                        radioInput.checked = "true";

                                                        radio_label.appendChild(radioInput);
                                                        div_radio.appendChild(radio_label);
                                                        //radioInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");

                                                        var mcqOptions = document.createElement('input');
                                                        mcqOptions.type = "text";
                                                        mcqOptions.id = "mcqOptions_" + lastid + "_1";
                                                        mcqOptions.name = "mcqOptions_" + lastid;
                                                        mcqOptions.value = "Option 1";
                                                        mcqOptions.className = "form-control col-md-7 col-xs-12";
                                                        //mcqOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");

                                                        option_row_left.appendChild(div_radio);
                                                        option_row_middle.appendChild(mcqOptions);

                                                        document.getElementById('question_typeBlock_' + lastid).appendChild(optionContainerMain);
                                                        document.getElementById(optionContainerMain.id).appendChild(optionContainer);

                                                        option_row.appendChild(option_row_left);
                                                        option_row.appendChild(option_row_middle);
                                                        option_row.appendChild(option_row_right);
                                                        optionContainer.appendChild(option_row);
                                                        //document.getElementById(optionContainer.id).appendChild(radioInput);
                                                        //document.getElementById(optionContainer.id).appendChild(mcqOptions);

                                                        var radioInput2 = document.createElement('input');
                                                        radioInput2.setAttribute('type', 'radio');
//                                                        radioInput2.disabled = true;
                                                        radioInput2.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");

                                                        var addOptions = document.createElement("button");
                                                        addOptions.className = "btn btn-round btn-primary";
                                                        addOptions.innerHTML = "<i class='fa fa-plus' aria-hidden='true'></i>";
                                                        //addOptions.setAttribute("style", "float: none; font-size: 16px; cursor:pointer; text-decoration: underline; color: #4F76A3;");
                                                        addOptions.addEventListener("click", function () {
                                                            addOptionsMCQ(lastid)
                                                        }, false);

                                                        var addOptionContainer = document.createElement('div');
                                                        addOptionContainer.id = 'addOptionContainer_' + lastid;
                                                        addOptionContainer.setAttribute("style", "padding: 5px;");

                                                        //alert(addOptionContainer.id);

                                                        document.getElementById('question_typeBlock_' + lastid).appendChild(addOptionContainer);
                                                        document.getElementById(addOptionContainer.id).appendChild(addOptions);
//                                                        Options end

                                                        /*append selectlist to right col*/
                                                        x_content_div.appendChild(x_content_row1);
                                                        x_content_div.appendChild(x_content_row2);
                                                        document.getElementById("question_" + lastid).appendChild(x_title_div);
                                                        document.getElementById("question_" + lastid).appendChild(x_content_div);

                                                        var labelQuestionError = document.createElement('label');
                                                        labelQuestionError.id = "labelQuestionError_" + lastid;
                                                        labelQuestionError.innerHTML = 'please fill all the information - question, question type, sequence ';
                                                        labelQuestionError.setAttribute("style", "display:none; color: #ff6666;");

                                                        var iDivButtons = document.createElement('div');
                                                        iDivButtons.id = 'qFunctions_' + lastid;
                                                        iDivButtons.setAttribute("style", "margin-left: 8px;")

                                                        var iDivQuestionMarks = document.createElement('div');
                                                        iDivQuestionMarks.id = 'QuestionMarks_' + lastid;
                                                        iDivQuestionMarks.className = "form-group";

                                                        var labelMarksQuestion = document.createElement('label');
                                                        labelMarksQuestion.innerHTML = 'Marks : ';

                                                        var marksInput = document.createElement('input');
                                                        marksInput.type = "number";
                                                        marksInput.id = "marksInput_" + lastid;
                                                        marksInput.name = "marksInput_" + lastid;
                                                        marksInput.maxlength = "3";
                                                        marksInput.setAttribute("style", "width: 80px; margin-left: 3px;");

                                                        iDivQuestionMarks.appendChild(labelMarksQuestion);
                                                        iDivQuestionMarks.appendChild(marksInput);

                                                        var qSave = document.createElement("button");
                                                        qSave.id = "qsave_" + lastid;
                                                        qSave.className = "btn btn-success";
                                                        qSave.innerHTML = "Save";
                                                        qSave.addEventListener("click", function () {
                                                            saveQuestions(lastid)
                                                        }, false);

                                                        var qEdit = document.createElement("button");
                                                        qEdit.id = "qedit_" + lastid;
                                                        qEdit.className = "btn btn-primary";
                                                        qEdit.innerHTML = "Edit";
                                                        qEdit.addEventListener("click", function () {
                                                            editQuestions(lastid)
                                                        }, false);

                                                        var qDelete = document.createElement("button");
                                                        qDelete.id = "qdelete_" + lastid;
                                                        qDelete.className = "btn btn-danger";
                                                        qDelete.innerHTML = "Delete";
                                                        qDelete.addEventListener("click", function () {
                                                            deleteQuestions(lastid)
                                                        }, false);

                                                        var qhiddenId = document.createElement("input");
                                                        qhiddenId.type = "hidden";
                                                        qhiddenId.id = "qhiddenId_" + lastid;
                                                        qhiddenId.value = "0";

                                                        x_content_row2_left.appendChild(qSave);
//                                                        x_content_row2_left.appendChild(qEdit);
//                                                        x_content_row2_left.appendChild(qDelete);
                                                        x_content_row2_left.appendChild(qhiddenId);
                                                        x_content_row2_left.appendChild(labelQuestionError);

//                                                        x_content_row1_right.appendChild(x_row1_right_element1);
                                                        x_content_row1_right.appendChild(iDivQuestionMarks);
                                                        x_content_row1_right.appendChild(x_row1_right_element3);

                                                        x_row1_left_element1.appendChild(input);
                                                        x_content_row1_left.appendChild(x_row1_left_element1);
                                                        x_row1_left_element2.appendChild(innerDiv);
                                                        x_content_row1_left.appendChild(x_row1_left_element2);

                                                        initCollpase();
                                                    }

                                                    function saveQuestions(questionId) {
                                                        var qtitle = document.getElementById("qtitle").value;
                                                        var quiz_id = document.getElementById("quiz_id").value;
                                                        document.getElementById("qinformationError").style.display = "none";
                                                        document.getElementById("labelQuestionError_" + questionId).style.display = "none";
                                                        if (qtitle.trim().length > 0) {
                                                            var questionText = document.getElementById("question_textarea_" + questionId).value;
                                                            var questionMarks = document.getElementById("marksInput_" + questionId).value;
                                                            if (questionText.trim().length === 0 || questionMarks === null) {
                                                                document.getElementById("labelQuestionError_" + questionId).style.display = "inline";
                                                            } else {
                                                                document.getElementById("labelQuestionError_" + questionId).style.display = "none";
                                                                var answer;
                                                                var countOptDiv = document.getElementsByClassName("optionContainer_" + questionId);
                                                                var options = '';

                                                                for (var i = 0; i < countOptDiv.length; i++)
                                                                {
                                                                    var optionsValue = document.getElementById('mcqOptions_' + questionId + '_' + (i + 1)).value.trim();
                                                                    if (i < countOptDiv.length - 1)
                                                                        options += optionsValue + "__";
                                                                    else
                                                                        options += optionsValue;
                                                                    if(document.getElementById('questionOption_' + questionId + '_' + (i + 1)).checked)
                                                                    {
                                                                        answer = i;
                                                                    }
                                                                }
                                                                saveQuestionsDetails(questionText, quiz_id, options, questionMarks, answer, questionId);
                                                            }
                                                        } else {
                                                            document.getElementById("qinformationError").style.display = "inline";
                                                            $.alert({
                                                                title: '',
                                                                content: 'please enter survey details first'
                                                            });
                                                        }
                                                    }

                                                    function saveQuestionsDetails(question, quiz_id, qOptions, qMarks, answer, questionId) {
                                                        var data = "question=" + question + "&quiz_id=" + quiz_id + "&optionarr=" + qOptions + "&qMarks=" + qMarks + "&answer=" + answer + "&questionId=" + questionId;
//                                                        alert(data);
                                                        $.ajax({
                                                            url: "angle_group/DAO_saveQuestionsDetails.jsp",
                                                            type: "GET",
                                                            data: data,
                                                            dataType: "json",
                                                            success: set_saveQuestionsDetail,
                                                            error: quizError
                                                        });
                                                    }
                                                    function quizError()
                                                    {
                                                        alert("Error! Please fill all the fields");
                                                    }
                                                    
                                                    function set_saveQuestionsDetail(data) {
                                                        var res = data.split("#");
                                                        if (parseInt(res[1]) > 0) {
                                                            document.getElementById("qhiddenId_" + parseInt(res[0])).value = parseInt(res[1]);
                                                            document.getElementById("qsave_" + parseInt(res[0])).style.display = 'none';
                                                            document.getElementById("qedit_" + parseInt(res[0])).style.display = 'inline';
                                                            $.alert({
                                                                title: 'Data Saved Successfully',
                                                                content: ''
                                                            });
                                                        } else {
                                                            $.alert({
                                                                title: 'Error',
                                                                content: ''
                                                            });
                                                        }
                                                    }

                                                    function initCollpase() {
                                                        $(".collapse-link").unbind("click");
                                                        $('.collapse-link').on('click', function () {
                                                            var $BOX_PANEL = $(this).closest('.x_panel'),
                                                                    $ICON = $(this).find('i'),
                                                                    $BOX_CONTENT = $BOX_PANEL.find('.x_content');

                                                            // fix for some div with hardcoded fix class
                                                            if ($BOX_PANEL.attr('style')) {
                                                                $BOX_CONTENT.slideToggle(200, function () {
                                                                    $BOX_PANEL.removeAttr('style');
                                                                });
                                                            } else {
                                                                $BOX_CONTENT.slideToggle(200);
                                                                $BOX_PANEL.css('height', 'auto');
                                                            }

                                                            $ICON.toggleClass('fa-chevron-up fa-chevron-down');
                                                        });
                                                    }


                                                    function submitQuiz()
                                                    {
                                                        location.reload();
                                                    }
                                                    
                                                    function addOptionsMCQ(id) {
//                                                        alert(document.getElementById("questionOption_1_1"));
                                                        var optionsDiv = document.getElementsByClassName("optionContainer_" + id);
                                                        var nextId = optionsDiv.length;
                                                        if (nextId == 0) {
                                                            nextId = 1;
                                                        } else {
                                                            var mcq_opt_id = document.getElementsByClassName("optionContainer_" + id)[nextId - 1].id;
                                                            var quesid_part = mcq_opt_id.split("_");
                                                            var lastOptId = parseInt(quesid_part[2])
                                                            nextId = (lastOptId + 1);
                                                        }

                                                        var optionContainer = document.createElement('div');
                                                        optionContainer.id = 'optionContainer_' + id + '_' + nextId;
                                                        optionContainer.className = 'form-group optionContainer_' + id;
                                                        //optionContainer.setAttribute("style", "padding-top: 10px;");

                                                        var div_row = document.createElement('div');
                                                        div_row.className = "row";

                                                        var div_row_left = document.createElement('div');
                                                        var div_row_middle = document.createElement('div');
                                                        var div_row_right = document.createElement('div');
                                                        div_row_left.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";
                                                        div_row_middle.className = "col-md-10 col-sm-8 col-xs-8 fluid form-group text-left";
                                                        div_row_right.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";

                                                        var div_radio = document.createElement('div');
                                                        div_radio.className = "radio";

                                                        var radio_label = document.createElement('label');

                                                        var radioInput = document.createElement('input');
                                                        radioInput.setAttribute('type', 'radio');
                                                        radioInput.id = 'questionOption_' + id + '_' + nextId;
//                                                        radioInput.disabled = true;
                                                        radioInput.className = "flat";
                                                        radioInput.name = 'questionOption_' + id;

                                                        radio_label.appendChild(radioInput);
                                                        div_radio.appendChild(radio_label);

                                                        /*var radioInput = document.createElement('input');
                                                         radioInput.setAttribute('type', 'radio');
                                                         radioInput.disabled = true;
                                                         radioInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 13px;");*/

                                                        var mcqOptions = document.createElement('input');
                                                        mcqOptions.type = "text";
                                                        mcqOptions.id = "mcqOptions_" + id + "_" + nextId;
                                                        mcqOptions.name = "mcqOptions_" + nextId;
                                                        mcqOptions.value = "Option " + nextId;
                                                        mcqOptions.className = "form-control col-md-7 col-xs-12";
                                                        //mcqOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");

                                                        var qOptionRemove = document.createElement("button");
                                                        //qOptionRemove.type = "button";
                                                        qOptionRemove.id = "qOptionRemove_" + nextId;
                                                        qOptionRemove.innerHTML = '<i class="fa fa-times" aria-hidden="true"></i>';
                                                        qOptionRemove.className = "btn btn-danger";
                                                        //qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
                                                        qOptionRemove.addEventListener("click", function () {
                                                            removeMCQOption(optionContainer.id)
                                                        }, false);

                                                        div_row_left.appendChild(div_radio);
                                                        div_row_middle.appendChild(mcqOptions);
                                                        div_row_right.appendChild(qOptionRemove);

                                                        document.getElementById('optionContainerMain_' + id).appendChild(optionContainer);
                                                        div_row.appendChild(div_row_left);
                                                        div_row.appendChild(div_row_middle);
                                                        div_row.appendChild(div_row_right);
                                                        optionContainer.appendChild(div_row);

//                                                        $(radioInput).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                    }

                                                    function removeMCQOption(id) {
                                                        document.getElementById(id).remove();
                                                        //alert("remove "+id)
                                                    }

                                                </script>
                                            </div>


                                            <div class="tab-pane" id="Submit_Quiz">
                                                <div class="row" style="">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="x_panel" id="allQuiz">
                                                            <div class="x_title">
                                                                <h4 style="color:#3f5265;"><b>Quiz</b></h4>
                                                                <h6>Number of quiz in the next 7 days : <s:property value="listOfUpcomingQuiz.size" /></h6>
                                                                <div class="clearfix"></div>
                                                            </div>

                                                            <div class="x_content">
                                                                <br>
                                                                <!-- start form for validation -->
                                                                    <s:iterator value="listOfUpcomingQuiz">
                                                                     <div class="w3-panel w3-card">
                                                                            <br>
                                                                            <label style="color:#526374;">  <s:property escape="false" value="title"/> </label>
                                                                            <p>Quiz Date : <s:property value="quizDate"/></p> 
                                                                            <p>Duration : <s:property value="duration"/>minutes</p> 
                                                                            <div class="col-md-8 col-sm-12 col-xs-12">
                                                                                <form id="quizForm" action="openQuiz.html" method="post">
                                                                                    <input type="hidden" name="userId" value="<s:property value="#session.loggedInUser.loginId"/>"/>
                                                                                    <input type="hidden" name="quizId" value="<s:property value="quizId"/>"/>
                                                                                    <input type="hidden" name="groupId" value="<s:property value="gid"/>"/>
                                                                                    <input type="hidden" name="title" value="<s:property value="title"/>"/>
                                                                                    <%
                                                                                        Date now = new Date();
                                                                                        Date quizDate = (Date)request.getAttribute("quizDate");
                                                                                        final long ONE_MINUTE_IN_MILLIS = 60000;//millisecs
                                                                                        int minutes = (Integer)request.getAttribute("duration");

                                                                                        long curTimeInMs = quizDate.getTime();
                                                                                        Date endDate = new Date(curTimeInMs + (minutes * ONE_MINUTE_IN_MILLIS));
                                                                                        quizDate = new Date(endDate.getTime() - (minutes * ONE_MINUTE_IN_MILLIS));
                                                                                        
                                                                                        AngleUtility utility = new AngleUtility();
                                                                                        Person quizUser = (Person) session.getAttribute("loggedInUser");
                                                                                        boolean attended = utility.attendedQuiz((Integer)request.getAttribute("quizId"), quizUser.getLoginId());
//                                                                                        boolean attended = true;
                                                                                        
                                                                                        if(now.after(quizDate) && endDate.after(now) && attended)
                                                                                        {
                                                                                    %>
                                                                                        <input type="submit" value="Enter" class="btn btn-primary">
                                                                                    <%
                                                                                        }
                                                                                    %>
                                                                                </form>
                                                                            </div>
                                                                            <br><br><br>
                                                                       </div>
                                                                    </s:iterator>
                                                                <br/><br/>

                                                            </div>
                                                        </div>        
                                                    </div>    
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="View_Quiz">
                                                <div class="row" style="">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="x_panel" id="allQuiz">
                                                            <div class="x_title">
                                                                <h4 style="color:#3f5265;"><b>Total no. of quizzes : </b> <s:property value="quizReport.totalQuizCount"/></h4>
                                                                <h6>Number of quizzes attempted : <s:property value="quizReport.quizAttemptedCount" /></h6>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>  
                                                   <div class="x_content">
                                                           <br>
                                                                <!-- start form for validation -->
                                                                <s:iterator value="quizReport.quizAttempted">
                                                                 <div class="w3-panel w3-card">
                                                                     <br>
                                                                     <label style="color:#526374;">  <s:property escape="false" value="title"/> </label>
                                                                     <p>Marks obtained : <s:property value="passingMarks"/></p> 
                                                                    <div class="col-md-8 col-sm-12 col-xs-12">
                                                                         <form id="quizForm" action="showReport.html" method="post">
                                                                          <input type="hidden" id="userId" name="userId" value="<s:property value='#session.loggedInUser.loginId'/>"/>
                                                                         <input type="hidden" id="Id" name="Id" value='<s:property value="quizId"/>'>
                                                                         <input type="submit" value="Show report" class="btn btn-primary">
                                                                         </form>
                                                                    </div>
                                                                    </div>
                                                                </s:iterator>
                                                                </div>
                                                   </div>
                              