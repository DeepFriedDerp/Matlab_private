function [aeroForces] = paramSpace_2_4_1_2_2_3_3(sailStates,airStates)

	CL = (4.285256)*sailStates.alpha + (-0.126739)*sailStates.beta + (-2.922580)*sailStates.p + (36.778694)*sailStates.q + (0.611486)*sailStates.r + (0.010784)*sailStates.de;
	CD = -0.374780;
	CY = (0.072837)*sailStates.alpha + (-0.024646)*sailStates.beta + (0.363045)*sailStates.p + (0.100923)*sailStates.q + (0.023785)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.389546)*sailStates.alpha + (-0.222567)*sailStates.beta + (-1.470028)*sailStates.p + (11.838980)*sailStates.q + (0.641177)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-14.509299)*sailStates.alpha + (0.441740)*sailStates.beta + (10.251534)*sailStates.p + (-147.195892)*sailStates.q + (-2.040731)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.017842)*sailStates.alpha + (-0.009930)*sailStates.beta + (-0.921394)*sailStates.p + (4.550612)*sailStates.q + (-0.012269)*sailStates.r + (0.000076)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end