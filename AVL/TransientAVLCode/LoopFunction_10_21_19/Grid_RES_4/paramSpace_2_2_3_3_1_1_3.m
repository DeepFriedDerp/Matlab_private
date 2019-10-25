function [aeroForces] = paramSpace_2_2_3_3_1_1_3(sailStates,airStates)

	CL = (4.172002)*sailStates.alpha + (-0.066010)*sailStates.beta + (-2.849070)*sailStates.p + (37.822460)*sailStates.q + (-0.885476)*sailStates.r + (0.011344)*sailStates.de;
	CD = -0.138100;
	CY = (-0.088006)*sailStates.alpha + (-0.024837)*sailStates.beta + (-0.306439)*sailStates.p + (-0.432842)*sailStates.q + (-0.020100)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.362237)*sailStates.alpha + (0.150989)*sailStates.beta + (-1.445519)*sailStates.p + (12.158318)*sailStates.q + (-0.749767)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-14.204980)*sailStates.alpha + (0.245590)*sailStates.beta + (9.539339)*sailStates.p + (-144.575424)*sailStates.q + (2.995475)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (0.161890)*sailStates.alpha + (0.011159)*sailStates.beta + (0.624269)*sailStates.p + (-2.257613)*sailStates.q + (-0.002016)*sailStates.r + (0.000060)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end