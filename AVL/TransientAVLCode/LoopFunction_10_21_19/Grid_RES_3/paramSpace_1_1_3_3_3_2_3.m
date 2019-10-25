function [aeroForces] = paramSpace_1_1_3_3_3_2_3(sailStates,airStates)

	CL = (3.941858)*sailStates.alpha + (-0.163961)*sailStates.beta + (-2.726673)*sailStates.p + (37.148525)*sailStates.q + (-1.079164)*sailStates.r + (0.010833)*sailStates.de;
	CD = 0.037160;
	CY = (0.053707)*sailStates.alpha + (-0.026342)*sailStates.beta + (-0.283679)*sailStates.p + (0.665001)*sailStates.q + (-0.049957)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.402184)*sailStates.alpha + (0.049336)*sailStates.beta + (-1.408807)*sailStates.p + (12.351428)*sailStates.q + (-0.753502)*sailStates.r + (0.000750)*sailStates.de;
	Cm = (-13.926054)*sailStates.alpha + (0.516045)*sailStates.beta + (8.945739)*sailStates.p + (-141.044128)*sailStates.q + (3.587706)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.156148)*sailStates.alpha + (0.019092)*sailStates.beta + (0.420786)*sailStates.p + (-1.657254)*sailStates.q + (-0.015192)*sailStates.r + (-0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end