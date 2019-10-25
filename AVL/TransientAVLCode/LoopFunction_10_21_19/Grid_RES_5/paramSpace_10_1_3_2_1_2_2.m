function [aeroForces] = paramSpace_10_1_3_2_1_2_2(sailStates,airStates)

	CL = (4.286251)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.791898)*sailStates.p + (37.460609)*sailStates.q + (1.034374)*sailStates.r + (0.011281)*sailStates.de;
	CD = -0.163200;
	CY = (-0.022489)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.417223)*sailStates.p + (-0.466417)*sailStates.q + (-0.029192)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.455297)*sailStates.alpha + (-0.189766)*sailStates.beta + (-1.385076)*sailStates.p + (11.609626)*sailStates.q + (0.870326)*sailStates.r + (0.000618)*sailStates.de;
	Cm = (-14.425862)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.289301)*sailStates.p + (-142.955811)*sailStates.q + (-3.508801)*sailStates.r + (-0.070744)*sailStates.de;
	Cn = (-0.028398)*sailStates.alpha + (0.013270)*sailStates.beta + (-0.832058)*sailStates.p + (3.775193)*sailStates.q + (0.004083)*sailStates.r + (0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end