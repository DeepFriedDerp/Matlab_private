function [aeroForces] = paramSpace_2_1_2_1_3_1_1(sailStates,airStates)

	CL = (7.277118)*sailStates.alpha + (-0.643246)*sailStates.beta + (-1.703281)*sailStates.p + (30.295876)*sailStates.q + (-2.882941)*sailStates.r + (0.010992)*sailStates.de;
	CD = -2.965880;
	CY = (0.699530)*sailStates.alpha + (-0.026512)*sailStates.beta + (-1.370229)*sailStates.p + (1.471504)*sailStates.q + (-0.089861)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (2.291294)*sailStates.alpha + (0.435492)*sailStates.beta + (-0.532670)*sailStates.p + (4.342040)*sailStates.q + (-2.587217)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.794715)*sailStates.alpha + (2.505523)*sailStates.beta + (5.047144)*sailStates.p + (-111.058342)*sailStates.q + (9.762099)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-2.563889)*sailStates.alpha + (0.046618)*sailStates.beta + (3.002258)*sailStates.p + (-14.651878)*sailStates.q + (0.029508)*sailStates.r + (-0.000616)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end