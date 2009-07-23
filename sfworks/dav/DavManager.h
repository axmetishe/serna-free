// 
// Copyright(c) 2009 Syntext, Inc. All Rights Reserved.
// Contact: info@syntext.com, http://www.syntext.com
// 
// This file is part of Syntext Serna XML Editor.
// 
// COMMERCIAL USAGE
// Licensees holding valid Syntext Serna commercial licenses may use this file
// in accordance with the Syntext Serna Commercial License Agreement provided
// with the software, or, alternatively, in accorance with the terms contained
// in a written agreement between you and Syntext, Inc.
// 
// GNU GENERAL PUBLIC LICENSE USAGE
// Alternatively, this file may be used under the terms of the GNU General 
// Public License versions 2.0 or 3.0 as published by the Free Software 
// Foundation and appearing in the file LICENSE.GPL included in the packaging 
// of this file. In addition, as a special exception, Syntext, Inc. gives you
// certain additional rights, which are described in the Syntext, Inc. GPL 
// Exception for Syntext Serna Free Edition, included in the file 
// GPL_EXCEPTION.txt in this package.
// 
// You should have received a copy of appropriate licenses along with this 
// package. If not, see <http://www.syntext.com/legal/>. If you are unsure
// which license is appropriate for your use, please contact the sales 
// department at sales@syntext.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
// 
// Copyright (c) 2004 Syntext Inc.
//
// This is a copyrighted commercial software.
// Please see COPYRIGHT file for details.

#ifndef DAV_DAVMANAGER_H_
#define DAV_DAVMANAGER_H_

#include "dav/dav_defs.h"
#include "dav/types.h"

namespace Common {
    class PropertyNode;
    class String;
}

namespace Dav {

class IoStream;
class ProgressIndicator;
class Protocol;
class IoRequestHandle;

class DAV_EXPIMP DavManager : public SernaApiBase {
public:
    virtual OpStatus open(UrlRef url, int openFlags, IoStream& ustream) = 0;
    virtual OpStatus open(UrlRef url, int openFlags, IoRequestHandle**) = 0;
    virtual OpStatus listCollection(UrlRef url, Common::PropertyNode* to) = 0;
    virtual OpStatus makeCollection(UrlRef url) = 0;
    virtual OpStatus getResourceInfo(UrlRef url, Common::PropertyNode* to) = 0;
    virtual OpStatus lock(UrlRef url, LockOp op, int key = 0) = 0;
    
    virtual void    closeSessions() = 0;

    static void     registerProtocol(Protocol*);
    static void     deregisterProtocol(Protocol*);
    
    virtual const Common::String& lastError() const = 0; 
    virtual void  setLastError(const Common::String&) = 0;

    static DavManager& instance();

    virtual ~DavManager() {}
};

} // namespace Dav

#endif // DAV_DAVMANAGER_H_
