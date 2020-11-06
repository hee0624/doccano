<template>
  <v-main>
    <v-container fluid>
      <v-row justify="center">
        <v-col cols="12" md="9">
          <v-card>
            <v-card-title>
              <multi-class-classification
                :labels="items"
                :annotations="currentDoc.annotations"
                :add-label="addLabel"
                :delete-label="removeLabel"
              />
            </v-card-title>
            <v-card-text class="title">
              {{ currentDoc.text }}
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
import MultiClassClassification from '~/components/organisms/annotation/MultiClassClassification'

export default {
  layout: 'demo',

  components: {
    MultiClassClassification,
    MetadataBox
  },

  data() {
    return {
      items: [
        {
          id: 4,
          text: '正向',
          prefix_key: null,
          suffix_key: 'p',
          background_color: '#7c20e0',
          text_color: '#ffffff'
        },
        {
          id: 5,
          text: '消极',
          prefix_key: null,
          suffix_key: 'n',
          background_color: '#fbb028',
          text_color: '#000000'
        }
      ],
      currentDoc: {
        id: 8,
        text: '铁矿石进口量之所以上涨是因为国内铁矿石产能十分不足。',
        annotations: [
          {
            id: 17,
            prob: 0.0,
            label: 5,
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
    removeLabel(annotationId) {
      this.currentDoc.annotations = this.currentDoc.annotations.filter(item => item.id !== annotationId)
    },
    addLabel(labelId) {
      const payload = {
        id: Math.floor(Math.random() * Math.floor(Number.MAX_SAFE_INTEGER)),
        label: labelId
      }
      this.currentDoc.annotations.push(payload)
    }
  }
}
</script>
