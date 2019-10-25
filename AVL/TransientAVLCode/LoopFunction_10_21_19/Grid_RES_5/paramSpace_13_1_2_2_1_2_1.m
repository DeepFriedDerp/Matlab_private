function [aeroForces] = paramSpace_13_1_2_2_1_2_1(sailStates,airStates)

	CL = (4.245853)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.321053)*sailStates.p + (35.233749)*sailStates.q + (1.448775)*sailStates.r + (0.011026)*sailStates.de;
	CD = -0.163280;
	CY = (-0.078719)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.483125)*sailStates.p + (-0.261301)*sailStates.q + (-0.085179)*sailStates.r + (-0.000055)*sailStates.de;

	Cl = (1.261377)*sailStates.alpha + (-0.231138)*sailStates.beta + (-1.009257)*sailStates.p + (8.728027)*sailStates.q + (1.121482)*sailStates.r + (0.000038)*sailStates.de;
	Cm = (-13.400118)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.203474)*sailStates.p + (-129.217163)*sailStates.q + (-4.829005)*sailStates.r + (-0.067754)*sailStates.de;
	Cn = (0.227862)*sailStates.alpha + (0.040756)*sailStates.beta + (-0.948704)*sailStates.p + (4.036373)*sailStates.q + (0.000873)*sailStates.r + (0.000152)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end