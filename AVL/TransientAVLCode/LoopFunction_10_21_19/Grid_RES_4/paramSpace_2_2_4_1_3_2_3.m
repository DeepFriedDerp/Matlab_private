function [aeroForces] = paramSpace_2_2_4_1_3_2_3(sailStates,airStates)

	CL = (3.952866)*sailStates.alpha + (-0.038014)*sailStates.beta + (-3.434808)*sailStates.p + (42.205097)*sailStates.q + (-0.876794)*sailStates.r + (0.011544)*sailStates.de;
	CD = -0.041170;
	CY = (0.110663)*sailStates.alpha + (-0.025456)*sailStates.beta + (-0.362507)*sailStates.p + (1.915493)*sailStates.q + (-0.023558)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.583879)*sailStates.alpha + (0.084086)*sailStates.beta + (-1.936690)*sailStates.p + (16.723408)*sailStates.q + (-0.648803)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-13.984957)*sailStates.alpha + (0.102424)*sailStates.beta + (11.521435)*sailStates.p + (-160.694275)*sailStates.q + (2.907299)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (0.206268)*sailStates.alpha + (0.007169)*sailStates.beta + (0.655556)*sailStates.p + (-4.063686)*sailStates.q + (0.008171)*sailStates.r + (-0.000644)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end