function [aeroForces] = paramSpace_1_1_1_2_2_2_2(sailStates,airStates)

	CL = (4.308141)*sailStates.alpha + (0.588481)*sailStates.beta + (-5.756894)*sailStates.p + (54.267105)*sailStates.q + (1.992206)*sailStates.r + (0.010851)*sailStates.de;
	CD = -5.785340;
	CY = (2.086385)*sailStates.alpha + (-0.032732)*sailStates.beta + (1.162146)*sailStates.p + (3.396739)*sailStates.q + (0.152759)*sailStates.r + (0.000767)*sailStates.de;

	Cl = (-0.662356)*sailStates.alpha + (-0.613397)*sailStates.beta + (-3.993912)*sailStates.p + (34.716270)*sailStates.q + (2.153807)*sailStates.r + (0.005253)*sailStates.de;
	Cm = (3.279601)*sailStates.alpha + (-2.358093)*sailStates.beta + (21.339817)*sailStates.p + (-230.091980)*sailStates.q + (-6.651719)*sailStates.r + (-0.080865)*sailStates.de;
	Cn = (-7.874560)*sailStates.alpha + (-0.105031)*sailStates.beta + (-3.250994)*sailStates.p + (14.567901)*sailStates.q + (-0.074889)*sailStates.r + (-0.000509)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end