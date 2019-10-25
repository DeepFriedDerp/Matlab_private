function [aeroForces] = paramSpace_2_4_1_3_1_2_1(sailStates,airStates)

	CL = (3.942460)*sailStates.alpha + (0.078276)*sailStates.beta + (-2.291578)*sailStates.p + (32.591522)*sailStates.q + (-0.179104)*sailStates.r + (0.010708)*sailStates.de;
	CD = 0.042460;
	CY = (-0.068936)*sailStates.alpha + (-0.025566)*sailStates.beta + (-0.006133)*sailStates.p + (-0.563442)*sailStates.q + (-0.000342)*sailStates.r + (-0.000120)*sailStates.de;

	Cl = (1.013660)*sailStates.alpha + (0.034960)*sailStates.beta + (-0.940369)*sailStates.p + (7.127583)*sailStates.q + (-0.124824)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-14.341351)*sailStates.alpha + (-0.376692)*sailStates.beta + (7.873732)*sailStates.p + (-129.238022)*sailStates.q + (0.644608)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.108833)*sailStates.alpha + (0.002951)*sailStates.beta + (-0.036093)*sailStates.p + (0.848542)*sailStates.q + (-0.006864)*sailStates.r + (0.000178)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end