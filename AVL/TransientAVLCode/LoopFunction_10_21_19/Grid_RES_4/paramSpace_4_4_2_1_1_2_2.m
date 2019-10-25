function [aeroForces] = paramSpace_4_4_2_1_1_2_2(sailStates,airStates)

	CL = (4.149402)*sailStates.alpha + (-0.253227)*sailStates.beta + (-2.412503)*sailStates.p + (35.263653)*sailStates.q + (1.400838)*sailStates.r + (0.010508)*sailStates.de;
	CD = -0.040330;
	CY = (-0.219903)*sailStates.alpha + (-0.019662)*sailStates.beta + (0.477345)*sailStates.p + (-1.664520)*sailStates.q + (-0.094890)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (1.380162)*sailStates.alpha + (-0.259966)*sailStates.beta + (-1.076641)*sailStates.p + (9.323096)*sailStates.q + (1.000959)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-13.828919)*sailStates.alpha + (0.864784)*sailStates.beta + (7.544068)*sailStates.p + (-131.445847)*sailStates.q + (-4.641082)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.214378)*sailStates.alpha + (0.029609)*sailStates.beta + (-0.862736)*sailStates.p + (4.575550)*sailStates.q + (0.014980)*sailStates.r + (0.000537)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end