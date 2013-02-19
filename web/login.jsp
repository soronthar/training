<form action="<%=request.getContextPath()%>/dispatch/login" method="POST">
    <table>
        <tr>
            <th><label for="login">Login:</label></th>
            <td><input id="login" name="login" type="text"></td>
        </tr>
        <tr>
            <th><label for="passwd">Password:</label></th>
            <td><input id="passwd" name="passwd" type="password"></td>
        </tr>
        <tfoot>
        <tr>
            <td colspan="2"><input type="submit"></td>
        </tr>
        </tfoot>
    </table>

    <input type="hidden" name="locale" value="es">
</form>
