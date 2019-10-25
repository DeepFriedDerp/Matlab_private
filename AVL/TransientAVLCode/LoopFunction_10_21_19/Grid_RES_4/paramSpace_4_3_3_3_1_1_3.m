function [aeroForces] = paramSpace_4_3_3_3_1_1_3(sailStates,airStates)

	CL = (3.878790)*sailStates.alpha + (-0.031376)*sailStates.beta + (-2.666085)*sailStates.p + (35.194759)*sailStates.q + (0.555673)*sailStates.r + (0.010251)*sailStates.de;
	CD = -0.017610;
	CY = (-0.080348)*sailStates.alpha + (-0.024225)*sailStates.beta + (0.034643)*sailStates.p + (-0.684401)*sailStates.q + (-0.006915)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.266237)*sailStates.alpha + (-0.002899)*sailStates.beta + (-1.328116)*sailStates.p + (11.101668)*sailStates.q + (0.258221)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-14.254123)*sailStates.alpha + (0.108557)*sailStates.beta + (9.240719)*sailStates.p + (-141.172913)*sailStates.q + (-1.905831)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.142647)*sailStates.alpha + (-0.000576)*sailStates.beta + (0.179207)*sailStates.p + (-1.200723)*sailStates.q + (-0.034443)*sailStates.r + (0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end