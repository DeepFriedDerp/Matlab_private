function [aeroForces] = paramSpace_2_4_3_3_2_2_1(sailStates,airStates)

	CL = (3.980204)*sailStates.alpha + (0.053766)*sailStates.beta + (-2.287001)*sailStates.p + (32.586269)*sailStates.q + (-0.292693)*sailStates.r + (0.010767)*sailStates.de;
	CD = 0.028080;
	CY = (-0.001935)*sailStates.alpha + (-0.024849)*sailStates.beta + (-0.057085)*sailStates.p + (-0.065300)*sailStates.q + (-0.003744)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.020191)*sailStates.alpha + (0.048342)*sailStates.beta + (-0.937466)*sailStates.p + (7.134769)*sailStates.q + (-0.184105)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.445189)*sailStates.alpha + (-0.167104)*sailStates.beta + (7.822798)*sailStates.p + (-129.003830)*sailStates.q + (0.983570)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (0.003697)*sailStates.alpha + (0.002291)*sailStates.beta + (0.085575)*sailStates.p + (-0.246890)*sailStates.q + (-0.002459)*sailStates.r + (0.000008)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end