<style>
    .highlight {
        background-color: yellow;
    }
</style>
<input type="text" id="filter-input" name="keyword" class="form-control" onkeyup="filter_content()" placeholder="Type to search..." aria-label="search" aria-describedby="search" autocomplete="off" style="font-size: 15px;padding-left: 7px;">


<script>
    function filter_content() { 
        var inputText = document.getElementById("filter-input"); 
        var innerHTML = inputText.innerHTML;
        var index = innerHTML.indexOf(text);
        if (index >= 0) {
            innerHTML = innerHTML.substring(0, index) + "<span class='highlight'>" + innerHTML.substring(index, index + text.length) + "</span>" + innerHTML.substring(index + text.length);
            inputText.innerHTML = innerHTML;
        }
    }
</script>