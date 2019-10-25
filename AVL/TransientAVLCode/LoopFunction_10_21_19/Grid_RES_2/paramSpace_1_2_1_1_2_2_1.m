function [aeroForces] = paramSpace_1_2_1_1_2_2_1(sailStates,airStates)

	CL = (4.203549)*sailStates.alpha + (-0.083106)*sailStates.beta + (-1.937411)*sailStates.p + (27.910206)*sailStates.q + (0.500342)*sailStates.r + (0.009925)*sailStates.de;
	CD = -0.474070;
	CY = (0.015539)*sailStates.alpha + (-0.023788)*sailStates.beta + (0.322712)*sailStates.p + (0.715008)*sailStates.q + (0.042435)*sailStates.r + (0.000151)*sailStates.de;

	Cl = (0.817079)*sailStates.alpha + (-0.214942)*sailStates.beta + (-0.710355)*sailStates.p + (4.755247)*sailStates.q + (0.631152)*sailStates.r + (-0.000447)*sailStates.de;
	Cm = (-14.650611)*sailStates.alpha + (0.317531)*sailStates.beta + (7.191491)*sailStates.p + (-121.082581)*sailStates.q + (-1.651220)*sailStates.r + (-0.067358)*sailStates.de;
	Cn = (0.487028)*sailStates.alpha + (-0.023658)*sailStates.beta + (-0.835011)*sailStates.p + (3.492079)*sailStates.q + (-0.014529)*sailStates.r + (-0.000127)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end