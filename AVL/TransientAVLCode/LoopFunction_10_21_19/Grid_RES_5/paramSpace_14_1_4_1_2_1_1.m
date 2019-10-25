function [aeroForces] = paramSpace_14_1_4_1_2_1_1(sailStates,airStates)

	CL = (4.470576)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.905576)*sailStates.p + (26.198370)*sailStates.q + (-0.694103)*sailStates.r + (0.009273)*sailStates.de;
	CD = -0.716620;
	CY = (0.270312)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.552554)*sailStates.p + (1.364607)*sailStates.q + (0.117596)*sailStates.r + (0.000286)*sailStates.de;

	Cl = (1.231239)*sailStates.alpha + (0.222226)*sailStates.beta + (-0.741133)*sailStates.p + (4.709156)*sailStates.q + (-0.822160)*sailStates.r + (-0.000242)*sailStates.de;
	Cm = (-15.715516)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.760351)*sailStates.p + (-122.335159)*sailStates.q + (2.149495)*sailStates.r + (-0.066282)*sailStates.de;
	Cn = (-1.005435)*sailStates.alpha + (-0.047236)*sailStates.beta + (1.362234)*sailStates.p + (-7.603995)*sailStates.q + (-0.081740)*sailStates.r + (-0.000504)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end