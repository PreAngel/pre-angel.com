const fs = require('fs')

fs.readdir('.', doRename)

function doRename(err, fileList) {
    if (err) {
        console.error('doRename err: ', err)
        return
    }

    fileList.forEach(function(element) {
        if (/\.jpg/.test(element)) {
            if (/^创业者如何/.test(element)) {
                // console.log(element)
                matches = /(\d+)\.jpg/.exec(element)

                const n = matches[1]
                // 人工智能世代降临 (36).png
                const target = `huan-ai-talk-${n}.jpg`
                console.log(target)
                fs.rename(element, target, function(err) {
                    if ( err ) {
                        console.log('ERROR: ' + err)
                        return
                    }
                    console.log('rename ', element, target)
                });
            }
        }           
    }, this);
}
