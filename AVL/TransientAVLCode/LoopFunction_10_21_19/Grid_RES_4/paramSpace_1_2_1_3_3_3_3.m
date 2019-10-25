function [aeroForces] = paramSpace_1_2_1_3_3_3_3(sailStates,airStates)

	CL = (3.825678)*sailStates.alpha + (-0.038145)*sailStates.beta + (-2.665345)*sailStates.p + (35.243572)*sailStates.q + (-0.564341)*sailStates.r + (0.010162)*sailStates.de;
	CD = 0.009010;
	CY = (0.078728)*sailStates.alpha + (-0.025775)*sailStates.beta + (-0.049158)*sailStates.p + (0.684401)*sailStates.q + (-0.009852)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.312247)*sailStates.alpha + (-0.016127)*sailStates.beta + (-1.359284)*sailStates.p + (11.500853)*sailStates.q + (-0.288189)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-14.055068)*sailStates.alpha + (0.153093)*sailStates.beta + (9.230550)*sailStates.p + (-141.172913)*sailStates.q + (1.956955)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.157143)*sailStates.alpha + (-0.001992)*sailStates.beta + (-0.163555)*sailStates.p + (1.268550)*sailStates.q + (-0.036211)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end