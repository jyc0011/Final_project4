<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    $(function(){
        $(".banner").html("").css("display", "none");
        $(".nav").html("").css("display", "none");
        $("footer").html("").css("display", "none");

        $("#close").on('click', function(){
            window.close();
        });

        $("#imgchangeForm").submit(function(){
            event.preventDefault();
            var form = $("#imgchangeForm")[0];
            var data = new FormData(form);
            if($("#filename").val() == ""){
                alert("이미지를 선택해주세요.");
                return false;
            }
            $.ajax({
                url: "${pageContext.servletContext.contextPath}/mypage/profileimgChangeOk",
                type: "post",
                data: data,
                async: false,
                processData: false,
                contentType: false,
                success: function(result){
                    console.log(result);
                    opener.parent.location.reload();
                    window.close();
                },
                error: function(error){
                    console.log(error.responseText);
                    document.location.reload();
                }
            });
        });
    });
</script>
<div>
    <form id="imgchangeForm" enctype="multipart/form-data">
        <input type="file" id="filename" name="filename"/><br/>
        <button type="submit" id="change">변경하기</button>
        <button type="button" id="close">닫기</button>   
    </form>
</div>
