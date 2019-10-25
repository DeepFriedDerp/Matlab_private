function [aeroForces] = paramSpace_1_2_2_2_3_1_2(sailStates,airStates)

	CL = (4.858990)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.551681)*sailStates.p + (38.560070)*sailStates.q + (-2.095494)*sailStates.r + (0.011385)*sailStates.de;
	CD = -0.637370;
	CY = (0.105040)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.790090)*sailStates.p + (0.759372)*sailStates.q + (-0.139314)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.657649)*sailStates.alpha + (0.364754)*sailStates.beta + (-1.184040)*sailStates.p + (10.769859)*sailStates.q + (-1.712112)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-13.053418)*sailStates.alpha + (0.000000)*sailStates.beta + (7.489660)*sailStates.p + (-134.568695)*sailStates.q + (6.976474)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.175653)*sailStates.alpha + (0.064316)*sailStates.beta + (1.595217)*sailStates.p + (-7.132517)*sailStates.q + (0.016202)*sailStates.r + (-0.000346)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end