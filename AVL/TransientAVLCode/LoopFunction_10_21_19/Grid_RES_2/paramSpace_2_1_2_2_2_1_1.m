function [aeroForces] = paramSpace_2_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.022994)*sailStates.alpha + (0.007417)*sailStates.beta + (-2.295500)*sailStates.p + (31.949617)*sailStates.q + (-0.031067)*sailStates.r + (0.010411)*sailStates.de;
	CD = -0.071800;
	CY = (0.077404)*sailStates.alpha + (-0.024102)*sailStates.beta + (-0.170414)*sailStates.p + (0.513811)*sailStates.q + (0.022472)*sailStates.r + (0.000109)*sailStates.de;

	Cl = (1.212850)*sailStates.alpha + (0.062149)*sailStates.beta + (-1.043107)*sailStates.p + (8.228285)*sailStates.q + (-0.153438)*sailStates.r + (0.000165)*sailStates.de;
	Cm = (-14.685022)*sailStates.alpha + (-0.047456)*sailStates.beta + (8.140016)*sailStates.p + (-130.467148)*sailStates.q + (0.059532)*sailStates.r + (-0.068233)*sailStates.de;
	Cn = (-0.310479)*sailStates.alpha + (-0.011432)*sailStates.beta + (0.495683)*sailStates.p + (-3.099653)*sailStates.q + (-0.027134)*sailStates.r + (-0.000197)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end