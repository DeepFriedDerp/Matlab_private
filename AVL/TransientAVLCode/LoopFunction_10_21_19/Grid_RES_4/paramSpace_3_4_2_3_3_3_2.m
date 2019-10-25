function [aeroForces] = paramSpace_3_4_2_3_3_3_2(sailStates,airStates)

	CL = (4.147008)*sailStates.alpha + (-0.192453)*sailStates.beta + (-2.569288)*sailStates.p + (35.448006)*sailStates.q + (0.849020)*sailStates.r + (0.011046)*sailStates.de;
	CD = -0.137260;
	CY = (0.062661)*sailStates.alpha + (-0.025265)*sailStates.beta + (0.295398)*sailStates.p + (0.498142)*sailStates.q + (-0.019379)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.157432)*sailStates.alpha + (-0.220956)*sailStates.beta + (-1.158562)*sailStates.p + (9.304929)*sailStates.q + (0.716096)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.110808)*sailStates.alpha + (0.717964)*sailStates.beta + (8.603853)*sailStates.p + (-136.384674)*sailStates.q + (-2.873979)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (0.017169)*sailStates.alpha + (0.010867)*sailStates.beta + (-0.620182)*sailStates.p + (2.291299)*sailStates.q + (-0.001306)*sailStates.r + (-0.000083)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end