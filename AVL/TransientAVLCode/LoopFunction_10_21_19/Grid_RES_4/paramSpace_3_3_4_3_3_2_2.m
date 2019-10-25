function [aeroForces] = paramSpace_3_3_4_3_3_2_2(sailStates,airStates)

	CL = (4.022574)*sailStates.alpha + (-0.028046)*sailStates.beta + (-2.571307)*sailStates.p + (34.966370)*sailStates.q + (0.216509)*sailStates.r + (0.010996)*sailStates.de;
	CD = 0.043810;
	CY = (0.062044)*sailStates.alpha + (-0.025207)*sailStates.beta + (0.017541)*sailStates.p + (0.498142)*sailStates.q + (-0.001097)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.221303)*sailStates.alpha + (-0.033484)*sailStates.beta + (-1.194655)*sailStates.p + (9.577101)*sailStates.q + (0.157253)*sailStates.r + (0.000312)*sailStates.de;
	Cm = (-14.607010)*sailStates.alpha + (0.132717)*sailStates.beta + (8.808834)*sailStates.p + (-137.428818)*sailStates.q + (-0.772023)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.123479)*sailStates.alpha + (0.002348)*sailStates.beta + (0.029323)*sailStates.p + (-0.855701)*sailStates.q + (-0.007449)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end