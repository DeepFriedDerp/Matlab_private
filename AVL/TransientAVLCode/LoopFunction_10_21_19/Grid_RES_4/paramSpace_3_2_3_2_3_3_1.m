function [aeroForces] = paramSpace_3_2_3_2_3_3_1(sailStates,airStates)

	CL = (4.341810)*sailStates.alpha + (0.093771)*sailStates.beta + (-2.198428)*sailStates.p + (32.883778)*sailStates.q + (1.092977)*sailStates.r + (0.011082)*sailStates.de;
	CD = -0.364360;
	CY = (0.040964)*sailStates.alpha + (-0.024635)*sailStates.beta + (0.419180)*sailStates.p + (0.870358)*sailStates.q + (-0.027444)*sailStates.r + (0.000186)*sailStates.de;

	Cl = (1.036917)*sailStates.alpha + (-0.221264)*sailStates.beta + (-0.908899)*sailStates.p + (7.245463)*sailStates.q + (0.978467)*sailStates.r + (-0.000122)*sailStates.de;
	Cm = (-13.788671)*sailStates.alpha + (-0.375720)*sailStates.beta + (7.276550)*sailStates.p + (-126.510948)*sailStates.q + (-3.726596)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.303795)*sailStates.alpha + (0.016048)*sailStates.beta + (-0.915037)*sailStates.p + (3.334909)*sailStates.q + (-0.000342)*sailStates.r + (-0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end