<select name="acc" id="acc">
	<?php
	foreach( $GroupGetAll as $obj )
	{
		$obj=(array)$obj;
		echo "<option value='".$obj["GroupId"]."'>".$obj["GroupName"]."</option>";
		//echo $obj["GroupName"];
		//echo "<option value='$obj'>$obj[\""GroupName\""]</option>";
	    /*foreach( $obj as $value )
	    {
	       echo "<option value=''>$value</option>"; // returns 1, Long Beach 2012
	    }*/
	}
	?>
</select>