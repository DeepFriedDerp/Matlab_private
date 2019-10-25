function [aeroForces] = paramSpace_3_3_3_3_3_2_1(sailStates,airStates)

	CL = (4.024721)*sailStates.alpha + (-0.019273)*sailStates.beta + (-2.311329)*sailStates.p + (32.841343)*sailStates.q + (0.173427)*sailStates.r + (0.010904)*sailStates.de;
	CD = 0.031450;
	CY = (0.071005)*sailStates.alpha + (-0.025197)*sailStates.beta + (-0.008028)*sailStates.p + (0.563442)*sailStates.q + (0.000546)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.087111)*sailStates.alpha + (-0.022009)*sailStates.beta + (-0.982194)*sailStates.p + (7.603652)*sailStates.q + (0.105303)*sailStates.r + (-0.000030)*sailStates.de;
	Cm = (-14.634265)*sailStates.alpha + (0.081394)*sailStates.beta + (7.943491)*sailStates.p + (-130.282166)*sailStates.q + (-0.605677)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (-0.119629)*sailStates.alpha + (0.001597)*sailStates.beta + (0.059233)*sailStates.p + (-0.884652)*sailStates.q + (-0.006623)*sailStates.r + (-0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end