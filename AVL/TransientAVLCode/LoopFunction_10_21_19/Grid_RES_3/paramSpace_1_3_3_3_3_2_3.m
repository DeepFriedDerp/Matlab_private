function [aeroForces] = paramSpace_1_3_3_3_3_2_3(sailStates,airStates)

	CL = (3.941858)*sailStates.alpha + (0.163961)*sailStates.beta + (-2.726673)*sailStates.p + (37.148525)*sailStates.q + (-1.079164)*sailStates.r + (0.010833)*sailStates.de;
	CD = 0.037160;
	CY = (0.053707)*sailStates.alpha + (-0.023320)*sailStates.beta + (-0.283679)*sailStates.p + (0.665001)*sailStates.q + (-0.049957)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.285132)*sailStates.alpha + (0.177309)*sailStates.beta + (-1.324155)*sailStates.p + (11.290560)*sailStates.q + (-0.738677)*sailStates.r + (0.000521)*sailStates.de;
	Cm = (-13.926053)*sailStates.alpha + (-0.516045)*sailStates.beta + (8.945739)*sailStates.p + (-141.044128)*sailStates.q + (3.587706)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.107903)*sailStates.alpha + (0.020872)*sailStates.beta + (0.435713)*sailStates.p + (-1.844313)*sailStates.q + (-0.012578)*sailStates.r + (-0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end