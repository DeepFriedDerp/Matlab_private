function [aeroForces] = paramSpace_1_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.526637)*sailStates.alpha + (0.671528)*sailStates.beta + (-5.889381)*sailStates.p + (54.882378)*sailStates.q + (2.114433)*sailStates.r + (0.010966)*sailStates.de;
	CD = -6.556040;
	CY = (2.321465)*sailStates.alpha + (-0.032508)*sailStates.beta + (1.222393)*sailStates.p + (4.023087)*sailStates.q + (0.161216)*sailStates.r + (0.000911)*sailStates.de;

	Cl = (-1.123817)*sailStates.alpha + (-0.652502)*sailStates.beta + (-4.110796)*sailStates.p + (35.755760)*sailStates.q + (2.316626)*sailStates.r + (0.005456)*sailStates.de;
	Cm = (5.057924)*sailStates.alpha + (-2.811921)*sailStates.beta + (21.871937)*sailStates.p + (-233.877655)*sailStates.q + (-7.145119)*sailStates.r + (-0.081508)*sailStates.de;
	Cn = (-8.769238)*sailStates.alpha + (-0.111966)*sailStates.beta + (-3.398241)*sailStates.p + (14.656214)*sailStates.q + (-0.071846)*sailStates.r + (-0.000737)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end