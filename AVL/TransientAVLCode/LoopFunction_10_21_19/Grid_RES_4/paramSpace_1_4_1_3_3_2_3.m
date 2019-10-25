function [aeroForces] = paramSpace_1_4_1_3_3_2_3(sailStates,airStates)

	CL = (3.786636)*sailStates.alpha + (0.266163)*sailStates.beta + (-2.696375)*sailStates.p + (37.303780)*sailStates.q + (-1.218162)*sailStates.r + (0.010465)*sailStates.de;
	CD = 0.077790;
	CY = (0.048907)*sailStates.alpha + (-0.022395)*sailStates.beta + (-0.350360)*sailStates.p + (0.684401)*sailStates.q + (-0.069764)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.271125)*sailStates.alpha + (0.227063)*sailStates.beta + (-1.303283)*sailStates.p + (11.247979)*sailStates.q + (-0.883450)*sailStates.r + (0.000497)*sailStates.de;
	Cm = (-13.122612)*sailStates.alpha + (-1.037637)*sailStates.beta + (8.736054)*sailStates.p + (-140.146637)*sailStates.q + (4.105069)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (0.138779)*sailStates.alpha + (0.029989)*sailStates.beta + (0.535913)*sailStates.p + (-1.975452)*sailStates.q + (-0.017726)*sailStates.r + (-0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end