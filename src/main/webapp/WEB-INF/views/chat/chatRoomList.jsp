<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="today" class="java.util.Date"/>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<body>
<div class="bodyWrap">
    <div class="chatTitleWrap">
									<span class="chatTitle">
										채팅리스트
									</span>
        <span class="chatBtn">
										<input type="button" id="newChatBtn" value="새로운 채팅"/>
									</span>
    </div>
    <div class="chatList">
        <c:forEach items="${chatRoomList}" var="ChatRoomDTO">
        <c:if test="${ChatRoomDTO.chatRoomVo.chat_type == 0 }"><!-- 1:1채팅방 이라면 -->
        <div class="listContent singleChat"
             id="${ChatRoomDTO.chatRoomVo.chatRoomNum}"
             data-chat_nickname="${ChatRoomDTO.chatReadVoList[0].chat_memberNick}"
             data-chat_userid="${ChatRoomDTO.chatReadVoList[0].chat_memberId}">
            </c:if>
            <c:if test="${ChatRoomDTO.chatRoomVo.chat_type == 1 }"><!-- 멀티 채팅방 이라면 -->
            <div class="listContent multiChat"
                 id="${ChatRoomDTO.chatRoomVo.chatRoomNum}"
                 data-chatroom_num="${ChatRoomD
        .chatRoomVo.chatRoomNum}">
                </c:if>

        <div class="firstWrap">
                    <c:if test="${ChatRoo
        chatRoomVo.chat_type == 0 }">
                        <c:choose>

                        <c:when test="${pageContext.reue

                rName == 'local
                        >



                              <img src="/resou
                        /profile_img/<c
                        lue="

                        							${ChatRoomDTO.chatReadVoList[0].chat_memberId}" />.png?${random}"



                        class="singleMemberIma

                        or="this.src='/resources
                        e_img
                        ile.png

                                                    <c:otherwise>


                        rc="/u
                        out value="

        tRoomDTO.chatReadVoList[0].chat_memberId}" />.png?${r
                                              class="singleMemberImage"

                           onerror="this.src='/ROOT
                g/profile_img/basicProfile.png'"

                          />
                            </c:otherwise>

                c:choose>
                    </c:if>
                    <c:if te
            oomDTO.
            chat_type == 1 }">
                        <c:choose>

                hen test="${pageContext.request.se
                localhost'}">

                h items="${ChatRoomDTO.chatReadVoList}"


            "chatReadVO" begin="0"
                                                 <img src="/resources/i
                    g/<c:out v
                        									${chatReadVO.chat_memberId}" />.png?${random}"

                                              class="multiMemberImage"
                                         onerror="this.src='/resources/img/profile_img/ba
                                 "/>

                                 forEach>
                            </c:when>

                        herwise>


                             items="${ChatRoomDTO.chatReadVoList}"
                                           var="chatReadVO" begin="0" end=

                                 oad/<c:out value="
																${chatReadVO.chat_memberId}" />.pn


                    s="multiMem

                                    onerror="this.src='/ROOT/resources/
                    mg/basicPr
                                                          />

                            h>
                            </c:otherwise>

                                             </c:choose>

                                           </div>
                <div class="secondWrap">
                    <div class="chatNick">

                                     f test="${ChatRoomDTO.ch
                                     pe == 0 }">
                            ${ChatRoomDTO.chatReadVoLi
                            erNick}

                              </c

                            {ChatRoomDTO.chatRoomVo.chat_type == 1 }">

                                              <c:if test="${ChatRoomDTO.ch
                                tle != null}">
                                ${ChatRoomDTO.chatRoomVo.chat_title}

                                      </c:if>

                                     if test="${ChatRoomDTO.chatRo
        Vo.chat_title == null}">



                            ms="${ChatRo

          VoList}"


                  var
                 varSt
            s">



                        est="$



                                     ${
                        dVO.cha

                                    </c:if>




                             <c:if test="${sta
                        ">

                                         ${chatR
                        membe




                                </c



                             </c:if>

             </c:if>


                      <div class="memberCount">


                :if test="${ChatRoomDTO.chatRoo

                                 1 }">

                                           DTO.chatRoomVo.headCount})


                             </
                                          </div>


                              ss="chatContent">


                t
                            tent



                /div>

                    <div class="th

                     <div class="ch

                        ate var="no
                    "${today}"
                                  M-dd"/>

                formatD
                            e"

                                                   value="${ChatR
                ontent
            " patt
            M-dd"/>


                choose>

                                                      <c:when test="${nowDate == regDate}">


                               ate va
                            DTO.chat
                                    ate}"
                                                pattern="a H:



                                 :when>
                            <c


                        formatDate val


                  tVo.regDate}"



                        =
                                                        </c:ot




                                 <
                    ChatRoomDTO
                != 0 }
                               <div class="chatCnt">

                                                          ${C
                                                         }+


                                     :if
                              </d


                                           ch>

                        di


    <div id="backGr
                                                  <div id="userListWra
                           <div id="titl

                                     팅할 회원을

                                                                  <div id="chosenMem


                                   <div

                       <input i
                ype='te
            ' onin
            (

                        placeholder="
                                ofocus
                          </div>


                               rList">



               리스

                                </div>
        <

                          tt
                               <d

          InviteWrap">



                "button" class=
                        tBt



                                   nvite













                                 lWrap">

                        ut type=


                             "n


                               "chat





               div>

                </div>
</
                                   var

                 ame = "
                        Na

                 = "$
                     ";
    var serverName = '
                             .request.


                om
                        ();
    var backG

                        ;
    v
                rap


                    rListWrap")



    $(document
                unctio


            {

        xhr.setReque
                f
             c



                    $("#newChatBtn").on("click", function



                            if

                                       openAlert("채팅방 생성 권
                                 );

               e

                            }

                                    Lis

                });


                                      ncel").on("click", f

        close


                                   tI
                                             unction (even
                                   var chosenUser = $(".chosenUser").get



                                 chosenUse



                            om





                        c: auth
                ="isAut
                ">

                        var myId = '${use

                            }'
                            var my
                    {userI
                ickName


             autho







                                        openAlert("로그인 해주세요");


                               return;




                                                      mited()
                                                          o
                        "채팅방 생성 기능이 제한되어 있습



                                                 var chatRoomData = {

                                       nerId: myId,


                                rNick: myNickName,

                            ch
                        1,

                                                 chosenUser.l

                         };




                            ew Array(c

                                 ength
                           if (
                ength =

                           atRoomDat


                                          ,
                roomOwn

                           ickName,
                chat_type: 0,

                    dCount:
                                    ngth +



                           var

                            erData

                        memberI
                        r[0]
                user_id"),
                chat_membe
                               chosenUser[0]).data("nick_name")

                                                        var commonData = {

                                         chatRoomVO: chatRoom
                                                  chatMemberVO: ch

                                ;

                common


                                    eSingleChat(commonData,


                                ti


                            status) {


                         if (st
                    ess")


                      closeUserList();


                      var popupX =

                reen.width / 2) -


                var popupY = (wi

                    n.heigh
                     (



                        .op

                Room/' + result + '?
                yId, "

            ight=500, width



                pupX
                    = ' + popupY);


                         },


                    on (s


                                    status
                r")


                          openAlert"S
                    리자


                                        }
                }

                                   );

                } else {


                                            0; i < chosenUserle

                         va


                            = {



                at_memberId: $(chosenU


                                            r


                           chat_member
                             se
                nick_n





                         VoArray[i] = cha
                                                  }




                nData =

            chatRo
                  om

                        chatMe

                                  :


                        ay
                };


                               commonSer
                                eMulti
                        onData

                functio
                        , st

                                            i
                                  success") {


                rList();


                                 var popupX = (window.sc

                         (


                               var po


                        en.height / 2) - (500


                        atRoom/' + result + '?userId=' + myId, "ti
                ul


                         500, width=400, sc

                            op
                        creenY= ' + p

                               }



                function (


                          if (

                        r") {



                                     er Error(관리자에게 문의해주세요)");



                        }



                  );
                }
                }




                  (document).on("click", ".
                t", function (event


                  <sec: authorize access="isAuthentica

                               var myId = '${use

                ame}';
                </sec: authorize>




                     f
                ul


                t





                return



                               var
                num
                t





                        var po



                .screen.width / 2) - (400 / 2);




                       op


                cre



            (500 / 2);





                n(


           troom_num + '?u

                    yId, "title" + chatroom







        =' + p

                 scr





                      });




                 op
            () {


                    bac
                 s(

         "bl





                rListWrap

        lay

                ;





                  etChatUserList(s

                                        or);


                      }


                                 clo

                    backGround.css("



                      userLi

                di
                no




                 $("#chosen



                chosenMembe

                   ;/





                search");



                            "




                ha

                              vite"



                   화


                tI


                ", true);



                          I






                           A



                te

                ", "gray");




                             function getCh

                llback,
                w

                          $.ajax

                             type: 'get




                     '

                          t?keyword






                            u

                sult, status, xhr

                c




                esult, status);








                    tion (x

                {




                              error(status);






                 });
                }






                    se


                xByte) {




                   nputVal(obj, 30);




                    st(showChatUse
                Error, ob




                             }




                 o

                         t



                        m





                   = obj.value;






                th = 0;
                var reSt





                         ringByteLength = (function (



                          for (b = i = 0

                arCodeAt(i++);) {





                7






                     Byte) {





                  }





                g




                        return b

                }





                            if (stringByteLength > maxBy



                alue = r



                                  o


                }




                o

                r(status) {


                 (status ==

                                        openAlert("S


                          세요
                           }



                  function s
                ist(chatUserLi


                f (
                =




                  var lengt



                .length;

                a
                t = $("#userList");
                v



                  var nick


                    var us



                     for (va
                i < l
                0; i++) {


                       n

                          atUserList[i].nickName;


                use

                serList[i].use

                            str +



                ='userWrap' data-user_id

                                ta-nick_name='" +






                class='userImage'>";




                     rName ==

                t



                           str += "<img src='/resources/


                /" + use




                          "


                e




        o

        is.src=\"/r


                /profile_im

                                >&nbsp"









                  /upload/"
                .png?" + rando
                s

                e h
                e




      /ROOT/res



        le_img/b

                .
        nbsp"





                  an>";



        tr +=



             erNickn

        str += ni




                  r += "</span>";



        r +








        l(str);



                        click", function (






        ers = $("#chosenMemb




                var s

                m



               tml());
                var u


        ).data("

                       var nick_n
                t


                ("nick_name");




                == "") {


                                 "<span





                e


                  ser_id='"
                    "' data-nick_n
                c

        " +
    m

    an>"

                        }



        User = $("#user




      chose

                 > 0)

                        chos





        s = $("#chosenM




                m



                ;



                } else {
                       str += "<sp




                ass='chosenUser' data-us



               d + "

        k_nam


            name +
                k_nam
            n>";



               }




    enMembers.html



              var



            osenUse




    n

    {

                var chatInvite = $("#chatInvit

                   chatInvite.attr

                    false);



            vite.css("backgr




            vite.cs



               ite");




                                  var chatIn

                             )


                      Invite.attr(



                rue);


                chatInvite.css("bac


                r", "#EAEAEA");
                ch
                            or", "gray");


                ;
                }




                unction getChatRoo

                            back




                    type: 'get',


                : '/getChatRoomList?userId=' + use
                         success

                result,


                   ) {
                if


                sult, st





                              err
                               t


                     if






                r(status);


                              }
                     });
                      }




                h
                t




                   getChatRoomList

                            ame}

                                    st

                                    if


                success") {

                var s


                r i = 0


                       .le
                {



                                   = result[i].c





                        chatRoomNum
                        ch
                             m;





                        _type == 0

                a
                     ckn
                s



                st[
                e



                               var chat_

                esult[i].chatR

                0].




                    r chat_type

                gleCh
                                           str += "<div
                    Con
                a



                    atRoomNum + "' data




                           name + "' data-chat_userid=
                                 +



                      } else i



                a



            'mu




                    = "<div class='listContent " + chat

         + "' id

              data-chatroo

                hatRoomNu
                                      }


                "


                    '>";

                if
                c

            pe == 0) {

                var use
                t[


                          0].chat_



    e

    'localhost') {





                    img src='/resources/img/profile_img/" + userId + ".png?

                             s='singleMemb

                    rror='thi



                                  g

                basicPro

                        "



                 {


                        img src='/upl

                 + ".png?" + random

                                  MemberImage



                /resources/img/profile_im





                }

                } else if (result[i].chatR
                            pe == 1) {

                var le

                                        R

                gth;





                oc

                             if (lengt

                            for (var j =

                        ) {





                            lt[i].chatReadVoList[j].c






                resources/img/profile_img/" + userId + ".png?" +

                ass='multiMembe
                        r

                        \"/r





                        il

                                 }



                                                        for (var j =



                            List.length; j++) {




                V

                _memberId;

                str += " <img src='/r

                rofile_img/" + userId + ".png?" + random + "'



                            error='t

                                                 o



                                          }



                } else {



                (length




                        0; j < 4;

                       var userId = r

                            eadVoList[j].chat_memberId;



                            src='/upload/" + userId + ".png?

                                    l



                                                              T



                sicProfi





                                               } else {



                       result[i].chatReadVoList.length; j++) {



                sult[i].chatReadVoList[j].chat_memberId;



                                    =

                                pload/"

                                              d
                '

                ge' oner



                                                   r



                _img/bas



                                               }
                }
                }




                  str += "</div>";//firstWrap



                div class='secondWrap'>";



                                    i
                                i



                                              c



                                    {



                = r

                                        a
                t






                                          (result[i].chatRoomVo.chat_



                       if (result[i].chat

                itle != null) {



                t[i].chatR
                                    e







                u







                if (j ==



                                               ength - 1) {



                tr += result[i]



                berNick;

                }




                                    t
                                c






                      }



                       }





                        += "</div>";//c



                        r += " <

                r



                                           t[i].chatRoomVo.chat_type == 1) {





                      a









                                          emberCount





                                t'>";
                str += resu













                v>";//seco



                                           iv class='thir



                                    c








                         lastChatT



                        ContentVo.regD


                            te;


                         tDate
                        a




                                   onService.displayDayTime
                                       ntentVo.regDa


                                 e {




                la

                        e(result[i].chatContentVo.reg


                                   }




                        = c



                /chatDate

                if (result[i].not



                                  str +=

                            >";

                                str +

                otReadCnt;






                         /chatCn



                tr +=

                >";//third
















                s



                                           f







                                        v







             }





                            }



                /









</html>