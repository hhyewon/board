function createPageList(totalPageCount, currentPage, pageRangeSize = 10, value = 0) {
  const output = document.createElement('div');
  output.append(createPageElement(1, '<<'));
  output.append(createPageElement(currentPage - 1, '<'));
  // page nav range 시작 점 (inclusive)
  const sectionStart = currentPage - ((currentPage - 1) % pageRangeSize);
  // page nav range 끝 점 (non-inclusive)
  const sectionEnd = sectionStart + pageRangeSize;

  // 각 페이지들을 밖으로 보냄
  for (let i = sectionStart; i < sectionEnd; i++) {
    if (i > totalPageCount) {
      break;
    }
    output.append(createPageElement(i, i, i === currentPage));
  }
  // 다음 페이지 네비
  output.append(createPageElement(currentPage + 1, '>'));
  output.append(createPageElement(totalPageCount, '>>'));

  return output;

  function createPageElement(name, content, isActive = false) {
    const temp = document.createElement('a');
    temp.innerText = content;
    temp.classList.add('number', 'page-nav-elem');

    if (Number.isInteger(content)) {
      temp.id = 'nav-to-page-' + content;
      if (isActive) temp.classList.add('on');
      temp.dataset.value = content;
    } else {
      temp.id = name;
      temp.classList.add(name);
      temp.dataset.value = name;
    }
    temp.style.cursor = 'pointer';
    temp.addEventListener('click', (event) => {
      movePage(temp.dataset.value, value);
    })
    return temp;
  }

  function movePage(pageNo, value) {
    if (pageNo > 0 && pageNo <= totalPageCount) {
      movePageImp(pageNo, value); //이 함수는 필요에 따라 적절한 형태로 구현 //데이터를 추가로 전달하는 value 추가
    }
  }

}



