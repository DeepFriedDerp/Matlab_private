function [aeroForces] = paramSpace_1_2_1_2_1_1_2(sailStates,airStates)

	CL = (4.271463)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.590866)*sailStates.p + (38.395443)*sailStates.q + (-1.716373)*sailStates.r + (0.011287)*sailStates.de;
	CD = -0.363960;
	CY = (-0.101484)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.567248)*sailStates.p + (-0.759371)*sailStates.q + (-0.099949)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.191745)*sailStates.alpha + (0.313909)*sailStates.beta + (-1.208556)*sailStates.p + (10.702078)*sailStates.q + (-1.423303)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-12.245564)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.940890)*sailStates.p + (-136.489655)*sailStates.q + (5.770877)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.083710)*sailStates.alpha + (0.055351)*sailStates.beta + (1.116494)*sailStates.p + (-3.702817)*sailStates.q + (-0.016885)*sailStates.r + (0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end