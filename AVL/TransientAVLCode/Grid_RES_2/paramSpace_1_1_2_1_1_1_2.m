function [aeroForces] = paramSpace_1_1_2_1_1_1_2(sailStates,airStates)

	CL = (6.187083)*sailStates.alpha + (0.228286)*sailStates.beta + (-2.513994)*sailStates.p + (31.445591)*sailStates.q + (-0.449189)*sailStates.r + (0.009342)*sailStates.de;
	CD = -2.042270;
	CY = (1.479177)*sailStates.alpha + (-0.047890)*sailStates.beta + (-0.491029)*sailStates.p + (12.037394)*sailStates.q + (-0.063793)*sailStates.r + (0.002559)*sailStates.de;

	Cl = (0.613176)*sailStates.alpha + (-0.268601)*sailStates.beta + (-1.363041)*sailStates.p + (11.798469)*sailStates.q + (0.115409)*sailStates.r + (0.000470)*sailStates.de;
	Cm = (-16.064770)*sailStates.alpha + (-1.205592)*sailStates.beta + (8.604269)*sailStates.p + (-135.414429)*sailStates.q + (1.339942)*sailStates.r + (-0.068131)*sailStates.de;
	Cn = (-1.427453)*sailStates.alpha + (-0.012271)*sailStates.beta + (0.583514)*sailStates.p + (-11.029205)*sailStates.q + (0.114147)*sailStates.r + (-0.003448)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end