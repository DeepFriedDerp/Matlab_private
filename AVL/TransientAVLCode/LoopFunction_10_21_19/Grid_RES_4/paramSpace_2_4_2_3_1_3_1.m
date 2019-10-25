function [aeroForces] = paramSpace_2_4_2_3_1_3_1(sailStates,airStates)

	CL = (4.201771)*sailStates.alpha + (-0.095115)*sailStates.beta + (-2.274771)*sailStates.p + (31.794273)*sailStates.q + (0.481666)*sailStates.r + (0.010582)*sailStates.de;
	CD = -0.193760;
	CY = (-0.102626)*sailStates.alpha + (-0.025447)*sailStates.beta + (0.316990)*sailStates.p + (-0.563443)*sailStates.q + (0.020796)*sailStates.r + (-0.000120)*sailStates.de;

	Cl = (1.121863)*sailStates.alpha + (-0.168001)*sailStates.beta + (-0.935092)*sailStates.p + (6.920658)*sailStates.q + (0.509181)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-14.843502)*sailStates.alpha + (0.355770)*sailStates.beta + (8.021826)*sailStates.p + (-129.238022)*sailStates.q + (-1.614857)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.393864)*sailStates.alpha + (-0.006714)*sailStates.beta + (-0.750288)*sailStates.p + (4.005601)*sailStates.q + (-0.011835)*sailStates.r + (0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end