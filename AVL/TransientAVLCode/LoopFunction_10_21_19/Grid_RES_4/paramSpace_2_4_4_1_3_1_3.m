function [aeroForces] = paramSpace_2_4_4_1_3_1_3(sailStates,airStates)

	CL = (7.258150)*sailStates.alpha + (0.631195)*sailStates.beta + (-3.473260)*sailStates.p + (44.598339)*sailStates.q + (-3.096299)*sailStates.r + (0.011912)*sailStates.de;
	CD = -2.955040;
	CY = (-0.262510)*sailStates.alpha + (-0.023349)*sailStates.beta + (-1.412089)*sailStates.p + (1.915493)*sailStates.q + (-0.092351)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (2.959489)*sailStates.alpha + (0.826230)*sailStates.beta + (-1.880658)*sailStates.p + (16.544807)*sailStates.q + (-2.722178)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-14.307883)*sailStates.alpha + (-2.338781)*sailStates.beta + (10.961091)*sailStates.p + (-159.650192)*sailStates.q + (10.431137)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (1.381021)*sailStates.alpha + (0.036514)*sailStates.beta + (3.016954)*sailStates.p + (-14.826626)*sailStates.q + (0.026907)*sailStates.r + (-0.000872)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end