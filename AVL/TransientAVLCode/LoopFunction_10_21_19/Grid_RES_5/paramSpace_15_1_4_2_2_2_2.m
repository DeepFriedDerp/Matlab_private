function [aeroForces] = paramSpace_15_1_4_2_2_2_2(sailStates,airStates)

	CL = (3.811243)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.695256)*sailStates.p + (39.662601)*sailStates.q + (1.781167)*sailStates.r + (0.010823)*sailStates.de;
	CD = -0.033600;
	CY = (0.074697)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.508932)*sailStates.p + (0.199283)*sailStates.q + (-0.126869)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.228546)*sailStates.alpha + (-0.262296)*sailStates.beta + (-1.327286)*sailStates.p + (12.229409)*sailStates.q + (1.379197)*sailStates.r + (0.000628)*sailStates.de;
	Cm = (-11.678711)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.169842)*sailStates.p + (-139.959488)*sailStates.q + (-5.934883)*sailStates.r + (-0.067023)*sailStates.de;
	Cn = (-0.316701)*sailStates.alpha + (0.065398)*sailStates.beta + (-0.875459)*sailStates.p + (2.507620)*sailStates.q + (-0.043418)*sailStates.r + (0.000004)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end