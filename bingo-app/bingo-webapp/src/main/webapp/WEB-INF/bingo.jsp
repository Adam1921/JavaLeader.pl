<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Simple JSP Application</title>
		<style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 20px;
        }
        body{
          margin: 0;
        }
        .container{
           background: green;
        	 width: 100%;
        	 display: flex;
        	 justify-content: center;
        }

        .item{
           color: white;
           font-weight: bold;
        	 align-self: center;
        }
        </style>
	</head>
	<body>

       <div class="container">
         <div class="item">
             <p>BINGO GAME</p>
             <c:forEach begin="0" end="4" varStatus="row">
               <c:forEach begin="0" end="4" varStatus="column">
                   ${winnerBingoCard[row.index][column.index]}
               </c:forEach>
               <br/>
            </c:forEach>

         </div>
       </div>

	    <table style="width:100%">
	        <tr>
              <c:forEach begin="1" end="5" varStatus="index">
                       <th>${index.index}</th>
               </c:forEach>
            </tr>

            <c:set var = "step"  value = "1"/>
            <c:forEach items="${allBingoCards.keySet()}" var="card"  varStatus="currentIndex">

                 <!-- get card according to key -->
                 <c:set var = "bingoCard" value = "${allBingoCards.get(card)}"/>

                 <c:choose>
                      <c:when test = "${currentIndex.index  % 5 == 0}">
                         <tr>
                      </c:when>
                 </c:choose>

                 <td>

                      <c:if test = "${card == winnerBingoCardIndex}">
                        <p> <b>CARD ${currentIndex.index + 1} => winner card!</b> <p>
                      </c:if>

                      <c:if test = "${card != winnerBingoCardIndex}">
                       <p>CARD ${currentIndex.index + 1}</p>
                      </c:if>

                     <c:forEach begin="0" end="4" varStatus="row">
                        <c:forEach begin="0" end="4" varStatus="column">
                            ${bingoCard[row.index][column.index]}
                        </c:forEach>
                        <br/>
                     </c:forEach>

                 </td>

                <c:choose>
                    <c:when test = "${step >= 5}">
                       </tr>
                       <c:set var = "step"  value = "1"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var = "step"  value = "${step + 1}"/>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
        </table>
	</body>
</html>