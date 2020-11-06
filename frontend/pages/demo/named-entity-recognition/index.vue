<template>
  <v-main>
    <v-container fluid>
      <v-row justify="center">
        <v-col cols="12" md="9">
          <v-card>
            <v-card-text class="title">
              <entity-item-box
                :labels="items"
                :text="currentDoc.text"
                :entities="currentDoc.annotations"
                :delete-annotation="removeEntity"
                :update-entity="updateEntity"
                :add-entity="addEntity"
              />
            </v-card-text>
          </v-card>
        </v-col>
        <v-col cols="12" md="3">
          <metadata-box :metadata="JSON.parse(currentDoc.meta)" />
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import MetadataBox from '@/components/organisms/annotation/MetadataBox'
import EntityItemBox from '~/components/organisms/annotation/EntityItemBox'

export default {
  layout: 'demo',

  components: {
    EntityItemBox,
    MetadataBox
  },

  data() {
    return {
      items: [
        {
          id: 4,
          text: 'LOC',
          prefix_key: null,
          suffix_key: 'l',
          background_color: '#7c20e0',
          text_color: '#ffffff'
        },
        {
          id: 5,
          text: 'TIME',
          prefix_key: null,
          suffix_key: 'm',
          background_color: '#fbb028',
          text_color: '#000000'
        },
        {
          id: 6,
          text: 'ORG',
          prefix_key: null,
          suffix_key: 'o',
          background_color: '#e6d176',
          text_color: '#000000'
        },
        {
          id: 7,
          text: 'PER',
          prefix_key: null,
          suffix_key: 'p',
          background_color: '#6a74b9',
          text_color: '#ffffff'
        }
      ],
      currentDoc: {
        id: 8,
        text: '宝岛眼镜首席运营官刘冀忠告诉我们，从2019年618到双11，宝岛眼镜全国1200多家门店的5000余名门店导购及总部、经销商的2000余名工作人员共计约7000余人，已经全部开通了钉钉导购分享及分销功能。',
        annotations: [
          {
            id: 17,
            prob: 0.0,
            label: 7,
            start_offset: 9,
            end_offset: 12,
            user: 1,
            document: 8
          },
          {
            id: 19,
            prob: 0.0,
            label: 6,
            start_offset: 0,
            end_offset: 4,
            user: 1,
            document: 8
          },
          {
            id: 16,
            prob: 0.0,
            label: 6,
            start_offset: 31,
            end_offset: 35,
            user: 1,
            document: 8
          }
        ],
        meta: '{"wikiPageId":2}',
        annotation_approver: null
      }
    }
  },

  methods: {
    removeEntity(annotationId) {
      this.currentDoc.annotations = this.currentDoc.annotations.filter(item => item.id !== annotationId)
    },
    updateEntity(labelId, annotationId) {
      const index = this.currentDoc.annotations.findIndex(item => item.id === annotationId)
      this.currentDoc.annotations[index].label = labelId
    },
    addEntity(startOffset, endOffset, labelId) {
      const payload = {
        id: Math.floor(Math.random() * Math.floor(Number.MAX_SAFE_INTEGER)),
        start_offset: startOffset,
        end_offset: endOffset,
        label: labelId
      }
      this.currentDoc.annotations.push(payload)
    }
  }
}
</script>
