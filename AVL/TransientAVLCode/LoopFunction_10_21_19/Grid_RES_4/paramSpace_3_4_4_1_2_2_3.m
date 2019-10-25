function [aeroForces] = paramSpace_3_4_4_1_2_2_3(sailStates,airStates)

	CL = (3.623722)*sailStates.alpha + (-0.117752)*sailStates.beta + (-3.431339)*sailStates.p + (41.895737)*sailStates.q + (0.462166)*sailStates.r + (0.011285)*sailStates.de;
	CD = 0.046490;
	CY = (0.021446)*sailStates.alpha + (-0.024479)*sailStates.beta + (0.133569)*sailStates.p + (-0.221996)*sailStates.q + (-0.008778)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.301514)*sailStates.alpha + (-0.091518)*sailStates.beta + (-1.872484)*sailStates.p + (15.815351)*sailStates.q + (0.355358)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-13.162621)*sailStates.alpha + (0.512816)*sailStates.beta + (11.637602)*sailStates.p + (-160.446381)*sailStates.q + (-1.599040)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-0.192233)*sailStates.alpha + (0.004302)*sailStates.beta + (-0.163924)*sailStates.p + (0.346164)*sailStates.q + (-0.004753)*sailStates.r + (0.000056)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end