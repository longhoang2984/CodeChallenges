//
// Copyright 2017 (C) Mediastep Software Inc.
//
// Created on : 1/4/18
// Author     : Hoàng Cửu Long
//
//-----------------------------------------------------------------------------
// Revision History (Release 1.0.0.0)
//-----------------------------------------------------------------------------
// VERSION     AUTHOR/      DESCRIPTION OF CHANGE
// OLD/NEW     DATE                RFC NO
//-----------------------------------------------------------------------------
// --/1.0  |Hoàng Cửu Long| Initial Create.
//         | 1/4/18       |
//---------|------------------|---------------------------------------------------
//         |Hoàng Cửu Long| Defect ID 1/Description
//         | 1/4/18      |
//---------|------------------|---------------------------------------------------
//
//  PersonDisplay.swift
//

import Foundation

struct PersonDisplay: Decodable {
    let name: String?
    let location: String?
    let avatar_url: String?
}
