function [aeroForces] = paramSpace_4_4_2_2_2_3_1(sailStates,airStates)

	CL = (4.427010)*sailStates.alpha + (-0.409845)*sailStates.beta + (-2.151348)*sailStates.p + (35.289291)*sailStates.q + (1.841788)*sailStates.r + (0.011038)*sailStates.de;
	CD = -0.483010;
	CY = (-0.068755)*sailStates.alpha + (-0.025713)*sailStates.beta + (0.633718)*sailStates.p + (0.301043)*sailStates.q + (-0.126065)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.082876)*sailStates.alpha + (-0.439299)*sailStates.beta + (-0.813585)*sailStates.p + (7.124658)*sailStates.q + (1.472212)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-11.947886)*sailStates.alpha + (1.505246)*sailStates.beta + (6.193831)*sailStates.p + (-122.964470)*sailStates.q + (-6.110285)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.548646)*sailStates.alpha + (0.062405)*sailStates.beta + (-1.334598)*sailStates.p + (5.490808)*sailStates.q + (0.004814)*sailStates.r + (0.000017)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end