function [aeroForces] = paramSpace_2_4_4_2_2_3_1(sailStates,airStates)

	CL = (4.383023)*sailStates.alpha + (-0.205264)*sailStates.beta + (-2.118900)*sailStates.p + (30.212070)*sailStates.q + (0.742996)*sailStates.r + (0.010492)*sailStates.de;
	CD = -0.436650;
	CY = (-0.085708)*sailStates.alpha + (-0.024862)*sailStates.beta + (0.440252)*sailStates.p + (-0.100923)*sailStates.q + (0.028845)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.023536)*sailStates.alpha + (-0.264298)*sailStates.beta + (-0.813268)*sailStates.p + (5.738983)*sailStates.q + (0.798630)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-14.899900)*sailStates.alpha + (0.899650)*sailStates.beta + (7.576044)*sailStates.p + (-125.105080)*sailStates.q + (-2.544915)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.552907)*sailStates.alpha + (-0.012330)*sailStates.beta + (-1.011094)*sailStates.p + (4.638882)*sailStates.q + (-0.010734)*sailStates.r + (0.000095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end