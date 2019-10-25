function [aeroForces] = paramSpace_1_2_2_3_1_3_1(sailStates,airStates)

	CL = (4.052250)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.218158)*sailStates.p + (30.966799)*sailStates.q + (-0.004887)*sailStates.r + (0.010220)*sailStates.de;
	CD = -0.135180;
	CY = (-0.102657)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.212087)*sailStates.p + (-0.665001)*sailStates.q + (0.037397)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.139973)*sailStates.alpha + (-0.079517)*sailStates.beta + (-0.961274)*sailStates.p + (7.338315)*sailStates.q + (0.185467)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-14.907957)*sailStates.alpha + (0.000000)*sailStates.beta + (8.027699)*sailStates.p + (-129.097870)*sailStates.q + (0.070540)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.399449)*sailStates.alpha + (-0.014021)*sailStates.beta + (-0.601754)*sailStates.p + (3.655958)*sailStates.q + (-0.043515)*sailStates.r + (0.000238)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end