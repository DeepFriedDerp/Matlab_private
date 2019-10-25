function [aeroForces] = paramSpace_4_1_2_2_3_1_3(sailStates,airStates)

	CL = (4.172294)*sailStates.alpha + (-0.048871)*sailStates.beta + (-2.794232)*sailStates.p + (34.565018)*sailStates.q + (-0.086081)*sailStates.r + (0.010006)*sailStates.de;
	CD = -0.402840;
	CY = (-0.004622)*sailStates.alpha + (-0.023385)*sailStates.beta + (-0.328267)*sailStates.p + (0.455226)*sailStates.q + (0.065280)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.529298)*sailStates.alpha + (0.144740)*sailStates.beta + (-1.509118)*sailStates.p + (12.496558)*sailStates.q + (-0.310078)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-14.824429)*sailStates.alpha + (0.255215)*sailStates.beta + (10.293462)*sailStates.p + (-145.756378)*sailStates.q + (0.206511)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.182146)*sailStates.alpha + (-0.040588)*sailStates.beta + (0.997560)*sailStates.p + (-5.871284)*sailStates.q + (-0.077065)*sailStates.r + (-0.000204)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end