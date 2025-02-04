CpAITaskDriveTo = {}
local AITaskDriveToCp_mt = Class(CpAITaskDriveTo, AITaskDriveTo)

function CpAITaskDriveTo.new(isServer, job, customMt)
    local self = AITaskDriveTo.new(isServer, job, customMt or AITaskDriveToCp_mt)
    return self
end

function CpAITaskDriveTo:setVehicle(vehicle)
    self.vehicle = vehicle
end

function CpAITaskDriveTo:start()
    if self.isServer then
        CpUtil.infoVehicle(self.vehicle, 'CP drive to task started')
        self.vehicle:startCpDriveTo(self, self.job:getCpJobParameters())
    end
end

function CpAITaskDriveTo:update()
end

function CpAITaskDriveTo:stop()
    if self.isServer then
        CpUtil.infoVehicle(self.vehicle, 'CP drive to task stopped')
        self.vehicle:stopCpDriveTo()
    end
    AITask.stop(self)
end

function CpAITaskDriveTo:onTargetReached(startPosition)
    self.isFinished = true
    self.job:setStartPosition(startPosition)
end