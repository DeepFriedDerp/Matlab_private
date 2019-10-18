function [aeroForces] = paramSpace_2_1_2_1_2_1_2(sailStates,airStates)

	CL = (6.144995)*sailStates.alpha + (-2.064881)*sailStates.beta + (-3.745587)*sailStates.p + (51.465302)*sailStates.q + (2.342551)*sailStates.r + (0.012852)*sailStates.de;
	CD = -6.409960;
	CY = (2.041451)*sailStates.alpha + (-0.137561)*sailStates.beta + (0.338279)*sailStates.p + (15.893985)*sailStates.q + (-0.036655)*sailStates.r + (0.003368)*sailStates.de;

	Cl = (-5.548516)*sailStates.alpha + (-1.096585)*sailStates.beta + (-1.908728)*sailStates.p + (16.585386)*sailStates.q + (2.571961)*sailStates.r + (0.001683)*sailStates.de;
	Cm = (4.374325)*sailStates.alpha + (9.235258)*sailStates.beta + (11.681823)*sailStates.p + (-166.091415)*sailStates.q + (-8.268532)*sailStates.r + (-0.068428)*sailStates.de;
	Cn = (-2.341473)*sailStates.alpha + (0.232069)*sailStates.beta + (-0.958386)*sailStates.p + (-8.916698)*sailStates.q + (-0.198431)*sailStates.r + (-0.004393)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end