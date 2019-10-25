function [aeroForces] = paramSpace_1_3_1_3_1_2_3(sailStates,airStates)

	CL = (3.738366)*sailStates.alpha + (0.182297)*sailStates.beta + (-2.750741)*sailStates.p + (37.120087)*sailStates.q + (-0.850001)*sailStates.r + (0.010629)*sailStates.de;
	CD = 0.091530;
	CY = (-0.058178)*sailStates.alpha + (-0.025711)*sailStates.beta + (-0.165630)*sailStates.p + (-0.318252)*sailStates.q + (-0.029175)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.189864)*sailStates.alpha + (0.145043)*sailStates.beta + (-1.339417)*sailStates.p + (11.250205)*sailStates.q + (-0.594408)*sailStates.r + (0.000580)*sailStates.de;
	Cm = (-13.385910)*sailStates.alpha + (-0.729164)*sailStates.beta + (9.221217)*sailStates.p + (-142.287766)*sailStates.q + (2.901660)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.234370)*sailStates.alpha + (0.020922)*sailStates.beta + (0.165091)*sailStates.p + (0.356109)*sailStates.q + (-0.034317)*sailStates.r + (0.000090)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end