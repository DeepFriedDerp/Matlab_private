function [aeroForces] = paramSpace_2_3_4_2_2_3_2(sailStates,airStates)

	CL = (4.502368)*sailStates.alpha + (-0.066175)*sailStates.beta + (-2.540696)*sailStates.p + (33.736469)*sailStates.q + (0.688722)*sailStates.r + (0.010843)*sailStates.de;
	CD = -0.431330;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.423692)*sailStates.p + (-0.000000)*sailStates.q + (0.027770)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.332502)*sailStates.alpha + (-0.226834)*sailStates.beta + (-1.183567)*sailStates.p + (9.264677)*sailStates.q + (0.752499)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-15.257504)*sailStates.alpha + (0.292871)*sailStates.beta + (8.985798)*sailStates.p + (-137.194580)*sailStates.q + (-2.366091)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.237072)*sailStates.alpha + (-0.013270)*sailStates.beta + (-1.001012)*sailStates.p + (4.636581)*sailStates.q + (-0.011529)*sailStates.r + (0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end